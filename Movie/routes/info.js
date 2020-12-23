const express = require("express");
const db = require("../db").db
const route = express.Router();

db.getConnection((error) => {
    if (error) {
        console.log(error)
    }
})


//Getting request from submit with Post method
route.get('/movie_detail', async(req, res) => {
    const { movie_id } = req.query
    const { movielist } = req.query

    //if user view in movie info page
    if (typeof(movie_id) != "undefined") {
        //     console.log(movie_id)
        db.query("SELECT * FROM `movie_info` WHERE Movie_id = ?", [movie_id], async(error, result) => {
            if (error) {
                console.log(error)
                return res.render("movie_detail", { movie_detail: null, select_info: null })
            } else {
                //console.log(result[0])
                await db.query("SELECT `Movie_id` , `Movie_name` FROM `movie_info`", [], (errors, results) => {
                    if (errors) {
                        console.log(errors)
                        return res.render("movie_detail", { movie_detail: result[0], select_info: null })
                    } else {
                        //console.log(results)
                        return res.render("movie_detail", { movie_detail: result[0], select_info: results })
                    }
                })
            }
        })
    } else if (typeof(movielist) != "undefined") { //if user view with dropdown list
        //   console.log(movielist)
        db.query("SELECT * FROM `movie_info` WHERE Movie_id = ?", [movielist], async(error, result) => {
            if (error) {
                console.log(error)
                return res.render("movie_detail", { movie_detail: null, select_info: null })
            } else {
                //console.log(result[0])
                await db.query("SELECT `Movie_id` , `Movie_name` FROM `movie_info`", [], (errors, results) => {
                    if (errors) {
                        console.log(errors)
                        return res.render("movie_detail", { movie_detail: result[0], select_info: null })
                    } else {
                        //console.log(results)
                        return res.render("movie_detail", { movie_detail: result[0], select_info: results })
                    }
                })
            }
        })

    }
});
module.exports = route;