const express = require("express");
const route = express.Router();
const authControllor = require("../Controllor/auth")


//Getting request from submit with Post method
route.post('/register', authControllor.register);
route.post('/login', authControllor.login);
route.get('/signout', authControllor.logout);
module.exports = route;