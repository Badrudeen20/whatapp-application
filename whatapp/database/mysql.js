const express = require('express');
const mysql = require('mysql');
const connect = mysql.createConnection({
        host:'localhost',
        user:'root',
        password:'',
        database:'node',
        multipleStatements:true
})

connect.connect(function(err){
     if(err) throw err
     console.log('mysql')
})


module.exports = connect
