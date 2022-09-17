const db = require('../../database/mysql');

module.exports = {
    room:function(input,callback){
        var sql = `SELECT * FROM users WHERE phone = ?`;
        db.query(sql,[input.phone],function(err,data,fields){
            if(err) throw err
            return callback(data);
         })
    },
    contact:function(input,callback){
        
        var sql = `SELECT * FROM contacts WHERE user_id = ?`;
        db.query(sql,[input.phone],function(err,data,fields){
            if(err) throw err
            return callback(data);
         })
    },

    checkContact:function(input,callback){
        
        var sql = `SELECT * FROM contacts WHERE user_id = ? AND contact_id = ?`;
        db.query(sql,[input.user_id,input.contact_id],function(err,data,fields){
            if(err) throw err
            return callback(data);
         })
    },
    
    detail:function(input,callback){
        var sql = `SELECT * FROM users WHERE id = ?`;
        db.query(sql,[input.contact_id],function(err,data,fields){
            if(err) throw err
            return callback(data);
         })
    },

    channel:function(input,callback){
        var sql = `SELECT * FROM rooms WHERE 
        (right_side = ${input.right} AND left_side = ${input.left}) OR  (right_side = ${input.left} AND left_side = ${input.right})`;
        db.query(sql,function(err,data,fields){
            if(err) throw err
            return callback(data);
         })
    },
    chat:function(input,callback){
        var sql = `SELECT * FROM chats WHERE room_id = ?`;
        db.query(sql,[input.room_id],function(err,data,fields){
            if(err) throw err
            return callback(data);
         })
    },
    
    message:function(input){
        var sql = `INSERT INTO chats SET ?`;
        db.query(sql,input)
    },
    unknown:function(input,callback){
        var sql = `INSERT INTO contacts SET ?`;
        db.query(sql,input,function(err,data,feilds){
             return callback(data)
        })
                
   

      
        

        // Object.entries(input).forEach(([key,val])=>{
        //     var sql = `SELECT * FROM users WHERE phone = "${val}"`;
          
        //     db.query(sql,function(err,data,fields){
        //         if(err) throw err
                
        //      })
        // }) 
    },
    add:function(input,callback){

        var sql_check = `SELECT * FROM contacts WHERE  (user_id = ${input.user_id} AND contact_id = ${input.contact_id})`;
       
        db.query(sql_check,function(err,data,fields){
        
            if(data.length > 0){
                // var sql_update = `UPDATE contacts SET name = "${input.name}" WHERE (user_id = ${input.user_id} AND contact_id = ${input.contact_id})`
                var sql_update = `UPDATE contacts SET name = "${input.name}" WHERE id=${data[0].id}`
                 db.query(sql_update,function(err,data,fields){
                    if(err) throw err
                    return callback(data)
                 })
            }else{
                var sql = `INSERT INTO contacts SET ?`;
                db.query(sql,input,function(err,data,fields){
                    if(err) throw err
                    return callback(data);
                })
            } 
          
        })

       
    },
    createRoom:function(input,callback){
        var sql = `SELECT * FROM rooms WHERE 
        (right_side = ${input.right_side} AND left_side = ${input.left_side}) OR  (right_side = ${input.left_side} AND left_side = ${input.right_side})`;
        db.query(sql,function(err,data,fields){
            if(err) throw err
            if(data.length > 0){
                return callback(data);
            }else{
                var sql = `INSERT INTO rooms SET ?`;
                db.query(sql,input,function(err,data,fields){
                    if(err) throw err
                    return callback(data);
                })
            }
         })
       
    }
    
}