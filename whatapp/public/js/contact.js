// $('#chat_tab').click(function(){
//     $.ajax({
//         url: "/fetchContact",
//         type: "POST",
//         data: "phone="+$('#room').val(),
//         success: function(data){
//           var { data } = data
//           $('#contact_container').empty()
//           data.forEach(ele => {
//             $('#contact_container').append(`
//             <li class="list-group-item" id="friend${ ele.contact_id }"
//              onclick="createRoom('${ele.contact_id}')">
//              ${ (ele.name !=null) ? ele.name : ele.contact_id }<br/>
//              <small id="online${ele.contact_id}>Online</small>
//              </li>
//             `)
//           });
          
//         }

//     })
// })