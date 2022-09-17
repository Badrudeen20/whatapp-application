//add user
$('#add_user').click(function(){
    const  form_data = $('#add_user_form').serialize()
    $.ajax({
       url: "/add",
       type: "POST",
       data: form_data+"&user_id="+$('#room').val(),
       success: function(data){
         var { success } = data
          if(success){
           $('#add_user_form')[0].reset()
          }
       }

})

})