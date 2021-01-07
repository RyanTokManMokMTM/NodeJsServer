const express = require("express");
const db = require("../db").db
const route = express.Router();
const auth = require("../Controllor/auth")
const dataformat = require("dateformat")

db.getConnection((error) => {
    if (error) {
        console.log(error)
    }
})


//Getting request from submit with Post method
route.get('/movie_detail', auth.UserAuth, async(req, res) => {
    if (req.user) {
        const { movie_id } = req.query
        const { movielist } = req.query

        //if user view in movie info page
        if (typeof(movie_id) != "undefined") {
            //     console.log(movie_id)
            db.query("SELECT * FROM `movie_info` WHERE Movie_id = ?", [movie_id], async(error, result) => {
                if (error) {
                    console.log(error)
                    return res.render("movie_detail", { movie_detail: null, select_info: null, user: req.user })
                } else {
                    //console.log(result[0])
                    let data = result[0].Movie_release_date
                    let data_format = dataformat(data, "fullDate")
                    result[0].Movie_release_date = data_format
                    await db.query("SELECT `Movie_id` , `Movie_name` FROM `movie_info`", [], (errors, results) => {
                        if (errors) {
                            console.log(errors)

                            return res.render("movie_detail", { movie_detail: result[0], select_info: null, user: req.user })
                        } else {
                            // console.log(result)
                            return res.render("movie_detail", { movie_detail: result[0], select_info: results, user: req.user })
                        }
                    })
                }
            })
        } else if (typeof(movielist) != "undefined") { //if user view with dropdown list
            //   console.log(movielist)
            db.query("SELECT * FROM `movie_info` WHERE Movie_id = ?", [movielist], async(error, result) => {
                if (error) {
                    console.log(error)
                    return res.render("movie_detail", { movie_detail: null, select_info: null, user: req.user })
                } else {
                    //console.log(result[0])
                    let data = result[0].Movie_release_date
                    let data_format = dataformat(data, "fullDate")
                    result[0].Movie_release_date = data_format
                    await db.query("SELECT `Movie_id` , `Movie_name` FROM `movie_info`", [], (errors, results) => {
                        if (errors) {
                            return res.render("movie_detail", { movie_detail: result[0], select_info: null, user: req.user })
                        } else {
                            //console.log(results)
                            return res.render("movie_detail", { movie_detail: result[0], select_info: results, user: req.user })
                        }
                    })
                }
            })

        }
    } else {
        const { movie_id } = req.query
        const { movielist } = req.query

        //if user view in movie info page
        if (typeof(movie_id) != "undefined") {
            //     console.log(movie_id)
            db.query("SELECT * FROM `movie_info` WHERE Movie_id = ?", [movie_id], async(error, result) => {
                if (error) {
                    console.log(error)
                    return res.render("movie_detail", { movie_detail: null, select_info: null, user: null })
                } else {
                    //console.log(result[0])
                    await db.query("SELECT `Movie_id` , `Movie_name` FROM `movie_info`", [], (errors, results) => {
                        if (errors) {
                            console.log(errors)
                            return res.render("movie_detail", { movie_detail: result[0], select_info: null, user: null })
                        } else {
                            //console.log(results)
                            return res.render("movie_detail", { movie_detail: result[0], select_info: results, user: null })
                        }
                    })
                }
            })
        } else if (typeof(movielist) != "undefined") { //if user view with dropdown list
            //   console.log(movielist)
            db.query("SELECT * FROM `movie_info` WHERE Movie_id = ?", [movielist], async(error, result) => {
                if (error) {
                    console.log(error)
                    return res.render("movie_detail", { movie_detail: null, select_info: null, user: null })
                } else {
                    //console.log(result[0])
                    await db.query("SELECT `Movie_id` , `Movie_name` FROM `movie_info`", [], (errors, results) => {
                        if (errors) {
                            console.log(errors)
                            return res.render("movie_detail", { movie_detail: result[0], select_info: null, user: null })
                        } else {
                            //console.log(results)
                            return res.render("movie_detail", { movie_detail: result[0], select_info: results, user: null })
                        }
                    })
                }
            })

        }
    }

});
module.exports = route;