const express = require("express");
const route = express.Router();
const authControllor = require("../Controllor/auth")

//for getting request form browser
//Request and Response
route.get("/", (req, res) => {
    res.render("index", { message: "123" });
});

route.get("/login", (req, res) => {
    res.render("login");
});

route.get("/register", (req, res) => {
    res.render("register");
});


module.exports = route;