const express = require("express");
const route = express.Router();
const authControllor = require("../Controllor/auth")

//for getting request form browser
//Request and Response
route.get("/", authControllor.UserAuth, (req, res) => {
    res.render("index", { user: req.user })
});


route.get("/login", (req, res) => {
    res.render("login", { message: null });
});

route.get("/register", (req, res) => {
    res.render("register", { message: null });
});


route.get("/profile", authControllor.UserAuth, (req, res) => {
    //chenking user authorization
    if (req.user) {
        console.log(req.user)
        res.render("profile", { user: req.user })
    } else {
        console.log("not login yet")
        res.redirect("/login")
    }

})

module.exports = route;