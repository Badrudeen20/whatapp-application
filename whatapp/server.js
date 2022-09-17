var express = require('express');
var app = express();
var http    = require( 'http' ).createServer( app );
var io      = require( 'socket.io' )( http );
const model = require('./app/model/chatModel')
const web = require('./router/web')
const PORT = 3000;


app.set('views',__dirname + '/view')
app.set('view engine','ejs') 
app.use(express.static('public/css'))
app.use(express.static('public/js'))
app.use(express.urlencoded({extended:true}))
app.use(web.login)

const users = {}
//socket io
io.on('connection', function(socket){
   //my  connection
   socket.on('myid',(id)=>{
       socket.join(id)
       users[socket.id] = id
       socket.broadcast.emit('user-connected',id)
      
      
   })
   //reconnect
   socket.on('reconnect',(id)=>{
      socket.broadcast.emit('check_me',id)
   })
  
   
  //send message 
  socket.on('send',(room,message,room_id,myId)=>{
   const input = {
      user_id:myId,
      room_id:room_id,
      message:message,
   }
   const contact = {
      user_id:room,
      contact_id:myId
   }
   model.checkContact(contact,function(data){
   
      model.message(input)
      socket.to(room).broadcast.emit('message',message,myId)
    
      if(data.length < 1){
         model.unknown(contact,function(data){
            
         })
      }
   })
  
  })








  //user disconneted
  socket.on('disconnect',()=>{
      getUserRoom(socket).forEach(room=>{
            socket.broadcast.emit('user-disconnect',users[socket.id])
            delete users[socket.id]
      })
   })
});



function getUserRoom(socket){

 return  Object.entries(users).reduce((contacts,[user,phone])=>{
      if(user != null)  contacts.push(phone)
      return contacts
   },[])
 }





http.listen( PORT, function() {
   console.log( 'server running on ' + PORT );
});

 