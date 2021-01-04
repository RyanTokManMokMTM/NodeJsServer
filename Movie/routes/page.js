const { Router } = require("express");
const express = require("express");
const authControllor = require("../Controllor/auth")
const infoControllor = require("../Controllor/info");
const { db } = require("../db");
const route = express.Router();

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
        res.render("profile", { user: req.user })
    } else {
        console.log("not login yet")
        res.redirect("/login")
    }

})

//get basic info

route.get("/movie", authControllor.UserAuth, infoControllor.movie_info, (req, res) => {
    if (req.user) {
        res.render("movie_info", { movie: req.movie_infos, user: req.user })
    } else {
        res.render("movie_info", { movie: req.movie_infos })
    }
})

route.get("/theater", infoControllor.theater, authControllor.UserAuth, (req, res) => {
    if (req.user) {
        res.render("theater_info", { data: req.theater, user: req.user })
    } else {
        res.render("theater_info", { data: req.theater })
    }

})

route.get("/ticket", authControllor.UserAuth, (req, res) => {
    if (req.user) {
        db.query("SELECT `Theater_id`,`Theater_name` FROM `theater_info`", [], async(error, result) => {
            if (error) {
                console.log("error");
                return res.render("ticket", { theater_info: null, user: req.user })
            } else {
                //theater info got
                return res.render("ticket", {
                    theater_info: result,
                    user: req.user
                })
            }
        })
    } else {
        db.query("SELECT `Theater_id`,`Theater_name` FROM `theater_info`", [], async(error, result) => {
            if (error) {
                console.log("error");
                return res.render("ticket", { theater_info: null, user: null })
            } else {
                //theater info got
                return res.render("ticket", {
                    theater_info: result,
                    user: null
                })
            }
        })
    }

})




module.exports = route;