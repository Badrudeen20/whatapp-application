const express = require('express')
const chatController = require('../app/controller/chatController')
const router = express.Router()


module.exports = {
    login:router.get('/login',chatController.login),
    room:router.post('/room',chatController.room),
    chat:router.post('/chats',chatController.chat),
    unknown:router.post('/unknown',chatController.unknown),
    add:router.post('/add',chatController.add),
    fetchContact:router.post('/fetchContact',chatController.fetchContact),
}