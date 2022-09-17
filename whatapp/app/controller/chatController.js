const { message } = require('../model/chatModel')
const model = require('../model/chatModel')


module.exports = {
    login:function(req,res){
        res.render('login')
   },
  //  room:async function(req,res){
   
  //     const input = {
  //       name:req.body.name,
  //       phone:req.body.phone
  //     }
     
  //         model.room(input,function(data){
  //          if(data.length > 0){
  //               const contact = {
  //                 id:data[0].id
  //                  }   
  //               model.contact(contact,async function(phone){
  //                   const friend = (user) => {
  //                     return new Promise((resolve, reject) => {
  //                       model.detail(user,function(dost){
  //                           return resolve(dost)
  //                       })
  //                     })
  //                   }
                      
  //                 let promise = Promise.all(phone.map(async (ele)=>{
  //                     return await friend(ele)
  //                   }))
  //                 await  res.render('index',{friend:await promise,input})
              
  //              })  

  //           }else{
  //             res.render('login')
  //           }
                     
  //       })    
        
  //  },


   room:function(req,res){
      const input = {
         name:req.body.name,
         phone:req.body.phone
      }
      model.room(input,function(data){
        if(data.length > 0){
         
          model.contact(input,function(friend){
            res.render('index',{friend:friend,input})
          })
        }else{
          res.render('login')
        }
      })
   },


   chat:function(req,res){
      const input = {
        left:req.body.chat,
        right:req.body.user
      }
     
      model.channel(input,function(data){
       if(data.length > 0){
        
          const room = {
            room_id:data[0].id
          }
    
          model.chat(room,function(message){
           
            res.json({
                message:message,
                room:room.room_id,
                success:true,

            })
          })
       
       }else{
        res.json({
          message:[],
          success:false
        })
       }
       
      })

      
   },


   unknown:function(req,res){
     const input = {
         contact_id:req.body.contact_id,
         user_id:req.body.user_id
     }
    model.unknown(input,function(data){
      if(data.affectedRows > 0){
        res.json({
          success:true
        })
      }
    })
   },

   add:function(req,res){
    const input = {
       user_id:req.body.user_id,
       name:req.body.name,
       contact_id:req.body.phone,
    }
    model.add(input,function(data){
    
      if(data.affectedRows > 0){
        const room = {
          left_side:input.user_id,
          right_side:input.contact_id
        }
  
       model.createRoom(room,function(data){
            res.json({
            success:true
           })
       })

         
      }
    })
  },
  fetchContact:function(req,res){
     const input = {
      phone:req.body.phone
     }
     
     model.room(input,function(data){
     
      if(data.length > 0){
        model.contact(input,function(friend){
        
          res.json({
            data:friend
          })
        })
      }

    })
   
  }


}
