const route = require("express").Router()
const db = require("../db").db
const cookie = require("cookie-parser")
const dateFormat = require('dateformat')
const generateNum = require("generate-serial-number")
const auth = require("../Controllor/auth")
const ticket_data = require("../Controllor/ticket_Data")
route.get("/viewShowTicket", auth.UserAuth, (req, res) => {
    if (req.user) {
        const { theater, movie, date, time } = req.query
        if ((typeof(theater) || typeof(movie) || typeof(date) || typeof(time)) == 'undefined') {
            console.log("error")

        }
        db.query("SELECT `session_info`.`Prices`,`movie_date_info`.`Date`,`movie_date_info`.`Time`,`theater_info`.`theater_name`,`movie_info`.`Movie_name`,`movie_info`.`Movie_poster`,`movie_info`.`Movie_restricted_level` FROM `session_info` INNER JOIN `movie_date_info` ON `session_info`.`Date` = `movie_date_info`.`Movie_date_id` INNER JOIN `theater_info` ON `session_info`.`Theater_id` = `theater_info`.`Theater_id` INNER JOIN `movie_info` ON `session_info`.`Movie_id` = `movie_info`.`Movie_id` WHERE `session_info`.`Session_id` = ?", [time], (error, result) => {
            if (error) {
                console.log(error)
            } else {
                var temp_date = result[0].Date
                var temp = dateFormat(temp_date, "fullDate")
                var temp_time = result[0].Time
                var temp2 = temp_time.slice(0, -3)
                var info = result[0]
                info.Date = temp
                info.Time = temp2
                console.log(info)


                const movie_data = {
                        session_id: time,
                        movie_info: info
                    }
                    //set cookie with movie info
                const cookie_option = {
                    expired: new Date(Date.now() + 30 * 60 * 1000) //delete in 30 mins
                }

                console.log(movie_data)
                res.cookie("ticket_movie_info", movie_data, cookie_option)
                res.render("viewTicket", { movie_info: info, user: req.user })

            }
        })
    } else {
        const { theater, movie, date, time } = req.query
        if ((typeof(theater) || typeof(movie) || typeof(date) || typeof(time)) == 'undefined') {
            console.log("error")

        }
        db.query("SELECT `session_info`.`Prices`,`movie_date_info`.`Date`,`movie_date_info`.`Time`,`theater_info`.`theater_name`,`movie_info`.`Movie_name`,`movie_info`.`Movie_poster`,`movie_info`.`Movie_restricted_level` FROM `session_info` INNER JOIN `movie_date_info` ON `session_info`.`Date` = `movie_date_info`.`Movie_date_id` INNER JOIN `theater_info` ON `session_info`.`Theater_id` = `theater_info`.`Theater_id` INNER JOIN `movie_info` ON `session_info`.`Movie_id` = `movie_info`.`Movie_id` WHERE `session_info`.`Session_id` = ?", [time], (error, result) => {
            if (error) {
                console.log(error)
            } else {
                var temp_date = result[0].Date
                var temp = dateFormat(temp_date, "fullDate")
                var temp_time = result[0].Time
                var temp2 = temp_time.slice(0, -3)
                var info = result[0]
                info.Date = temp
                info.Time = temp2
                console.log(info)


                const movie_data = {
                        session_id: time,
                        movie_info: info
                    }
                    //set cookie with movie info
                const cookie_option = {
                    expired: new Date(Date.now() + 30 * 60 * 1000) //delete in 30 mins
                }

                console.log(movie_data)
                res.cookie("ticket_movie_info", movie_data, cookie_option)
                res.render("viewTicket", { movie_info: info, user: null })

            }
        })
    }

})

route.get("/ViewTicketSeat", auth.UserAuth, async(req, res) => {
    if (req.user) {
        //   console.log(req.cookies)
        var info = req.cookies["ticket_movie_info"]
        var movie = info.movie_info

        var shopping_list = req.cookies

        db.query("SELECT `Seat_info`.`Seat_id`,`Seat_info`.`Seat_num` FROM `Seat_info` INNER JOIN `Session_info` ON `Seat_info`.`Session_id` = `Session_info`.`Session_id` WHERE `Seat_info`.`Session_id` =? and `Seat_info`.`Seat_status` = true", [info.session_id], (error, result) => {
            if (error) {
                console.log(error)
                res.render("viewTicketSeat", { movie_info: movie, list: shopping_list, seat_status: NULL, user: req.user })
            } else {
                // console.log(result)
                res.render("viewTicketSeat", { movie_info: movie, list: shopping_list, seat_status: result, user: req.user })
            }
        })

    } else {
        //   console.log(req.cookies)
        var info = req.cookies["ticket_movie_info"]
        var movie = info.movie_info

        var shopping_list = req.cookies

        db.query("SELECT `Seat_info`.`Seat_id`,`Seat_info`.`Seat_num` FROM `Seat_info` INNER JOIN `Session_info` ON `Seat_info`.`Session_id` = `Session_info`.`Session_id` WHERE `Seat_info`.`Session_id` =? and `Seat_info`.`Seat_status` = true", [info.session_id], (error, result) => {
            if (error) {
                console.log(error)
                res.render("viewTicketSeat", { movie_info: movie, list: shopping_list, seat_status: NULL, user: null })
            } else {
                // console.log(result)
                res.render("viewTicketSeat", { movie_info: movie, list: shopping_list, seat_status: result, user: null })
            }
        })

    }
})

route.get("/ViewUserTicket", auth.UserAuth, ticket_data.loadTicket, async(req, res) => {
    if (req.user) { //if user is login
        console.log(req.movie_info)
        res.render("ticket_view", { user: req.user, info: req.movie_info, ticket_info: req.info })
        res.clearCookie("ticket_movie_info")
        res.clearCookie("FT")
        res.clearCookie("DT")

    } else {
        res.redirect("../login") //if not login go to login page
    }
})


module.exports = route