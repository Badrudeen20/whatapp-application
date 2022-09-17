 var socket = io();

var msgForm = $('#msgForm')
const msg_input = $('#message-input')
var room = null
var room_id = null
var check_me = false
const users = []
socket.emit('myid',$('#room').val())
function createRoom(id){
    room = id
    $('.list-group li').each(function(){
        this.classList.remove('active')
   })
   $(`#friend${id}`).addClass('active')

   $.ajax({
        url: "/chats",
        type: "POST",
        data: `chat=${id}&user=${$('#room').val()}`,
        success: function(message){
             var {message,success,room} = message  
             $('#msg_container').empty()
             if(success){
                $('#room_id').val(room)
              
                
                message.forEach(element => {

                    $('#msg_container').append($(`
                        <div class="m-1 p-1 d-flex  justify-content-${ (element.user_id != id) ? 'end' : 'start'}">
                        <span class="bg-${(element.user_id != id) ? 'info':'success'} py-1 px-2 text-light" 
                        style="border-radius: 10px;">${element.message}</span>
                        </div>
                   `))
                
                });
                
                $('#msg_container').scrollTop($('#msg_container').height());
             }
        }
    });

}




if(msgForm[0] !=null){
    msgForm.submit(function(e){
        e.preventDefault()
        if(msg_input.val().trim() == '') return 
        const message = msg_input.val()
        socket.emit('send',room,message,$('#room_id').val(),$('#room').val())
        msg_input.val('')
        appendMsg(message,true)
    })
}

socket.on('message',(message,myId)=>{
    appendMsg(`${message}`,null,myId)
})

socket.on('check_me',(phone)=>{
   if(!users.includes(phone)){
     users.push(phone)
   }
    if(phone){
        $(`#online${phone}`).removeClass('d-none')
    }
})

socket.on('user-connected',(phone)=>{
    if(!users.includes(phone)){
        users.push(phone)
    }
  
    if(phone){
        $(`#online${phone}`).removeClass('d-none')
        myConnection()
    }
})

function myConnection(){
    socket.emit('reconnect',$('#room').val())
}
    
   



function appendMsg(message,type=null,id=null){
  
        if(message != ""){
            if(type==null){
                if($(`#friend${id}`).length){
                    if($(`#friend${id}`).hasClass('active')){
                        $('#msg_container').append($(`<div class="m-1 p-1 d-flex  justify-content-start">
                        <span class="bg-success py-1 px-2 text-light" 
                        style="border-radius: 10px;">${message}</span>
                        </div>`))
                        $('#msg_container').scrollTop($('#msg_container').height());
                    }  
                }else{
                     $('#contact_container').append(`<li class="list-group-item" id="friend${id}"
                      onclick="createRoom('${id}')">${id}</li>`)
                      
                }
               
            }else{
                $('#msg_container').append($(`<div class="m-1 p-1 d-flex  justify-content-end">
                <span class="bg-info py-1 px-2 text-light" 
                style="border-radius: 10px;">${message}</span>
                </div>`))
                $('#msg_container').scrollTop($('#msg_container').height());
            }
           
        } 
   
}

socket.on('user-disconnect',(phone)=>{
    removeItem(users, phone);
    if(phone){
        $(`#online${phone}`).addClass('d-none')
    }
})

//fetch user
$('#chat_tab').click(function(){
    $.ajax({
        url: "/fetchContact",
        type: "POST",
        data: "phone="+$('#room').val(),
        success: function(data){
          var { data } = data
          $('#contact_container').empty()
          data.forEach(ele => {
            $('#contact_container').append(`
            <li class="list-group-item" id="friend${ ele.contact_id }"
             onclick="createRoom('${ele.contact_id}')">
             ${ (ele.name !=null) ? ele.name : ele.contact_id }<br/>
             <small id="online${ele.contact_id}" class="${(users.includes(ele.contact_id) ? "":"d-none")}">Online</small>
             </li>
            `)
          });
        
       

        
          
        }

    })
})


function removeItem(array, item){
    for(var i in array){
        if(array[i]==item){
            array.splice(i,1);
            break;
        }
    }
}