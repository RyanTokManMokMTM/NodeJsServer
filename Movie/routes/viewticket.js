const route = require("express").Router()
const db = require("../db").db
const cookie = require("cookie-parser")
const dateFormat = require('dateformat')
const generateNum = require("generate-serial-number")
const auth = require("../Controllor/auth")

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

route.get("/ViewUserTicket", auth.UserAuth, async(req, res) => {
    if (req.user) { //if user is login
        var ticket_session
        var user_point = req.user.Cash_point //updated user cashpoint
        var info = req.cookies["ticket_movie_info"].movie_info
        var session_ids = req.cookies["ticket_movie_info"].session_id
        var full, full_price, discount, discount_price

        var full_ticket = req.cookies["FT"]
        var discount_ticket = req.cookies["DT"]

        if (full_ticket != undefined) {

            full_ticket = JSON.parse(req.cookies["FT"])
            full = full_ticket["Count"]
            var full_price = full_ticket["Price"]
        }

        if (discount_ticket != undefined) {
            discount_ticket = JSON.parse(req.cookies["DT"])
            discount = discount_ticket["Count"]
            discount_price = discount_ticket["Price"]
        }

        var seat = JSON.parse(req.cookies["seat"])

        db.query("SELECT `Session_info`.`Movie_id`,`Session_info`.`Theater_id`,`Session_info`.`Date` FROM `Session_info` WHERE `Session_info`.`Session_id` = ?", [session_ids], (error, session) => {
            if (error) {
                console.log(error)
                res.send(error)
            } else {
                ticket_session = session
            }
        })
        var ticket_temp = {}
        db.query("SELECT `Ticket_id` FROM `user_ticket_record`", [], (error, result) => { //count current ticket id 
            if (error) {
                console.log(error)
            } else {
                for (var i = 0; i < result.length; i++) {
                    ticket_temp[result[i].Ticket_id] = result[i].Ticket_id
                }
            }
        })
        var ticketNumber
        var ticket_info = []
        for (var key in seat) {
            await (db.query("INSERT INTO `Seat_info` SET ?", { Session_id: req.cookies["ticket_movie_info"].session_id, Seat_num: seat[key], Seat_status: true },
                async(error, result) => {
                    if (error) {
                        console.log(error)
                    } else {
                        var ticketNumber
                        do {
                            //check ticket id is unique 
                            var serialNumber = generateNum.generate(8)
                            ticketNumber = "FX" + serialNumber
                        } while (ticket_temp.hasOwnProperty(ticketNumber));
                        ticket_temp[ticketNumber] = ticketNumber //add to temp list

                        if (full != 0 && full_ticket != undefined && full != undefined) {
                            var seat_id = parseInt(result.insertId)
                                // console.log(ticketNumber)
                            await (db.query("INSERT INTO `user_ticket_record` SET ?", { Ticket_id: ticketNumber, Uid: req.user.Uid, Movie_id: ticket_session[0].Movie_id, Theater_id: ticket_session[0].Theater_id, Date_id: ticket_session[0].Date, Seat_id: seat_id, Total_prices: full_price, Payment_type: "cash_point", Ticket_status: "unuse", Ticket_type: "FULL TICKET" }, (error, result) => {
                                if (error) {
                                    console.log(error)
                                } else {
                                    var temp = { "ticketserialnum": ticketNumber, "type": "FULL TICKET", "price": full_price, "seat": seat[key] }
                                    full--
                                    ticket_info.push(temp)
                                }
                            }))
                        } else if (discount != 0 && discount_ticket != undefined && discount != undefined) {
                            var seat_id = parseInt(result.insertId)
                            await (db.query("INSERT INTO `user_ticket_record` SET ?", { Ticket_id: temp["ticketserialnum"], Uid: req.user.Uid, Movie_id: ticket_session[0].Movie_id, Theater_id: ticket_session[0].Theater_id, Date_id: ticket_session[0].Date, Seat_id: seat_id, Total_prices: discount_price, Payment_type: "cash_point", Ticket_status: "unuse", Ticket_type: "DISOCUNT TICKET" }, (error, result) => {
                                if (error) {
                                    console.log(error)
                                } else {
                                    var temp = { "ticketserialnum": ticketNumber, "type": "DISOCUNT TICKET", "price": discount_price, "seat": seat[key] }
                                    discount--
                                    ticket_info.push(temp)
                                }
                            }))
                        }
                    }
                }))
        }

        // console.log("hi")
        res.clearCookie("ticket_movie_info")
        res.clearCookie("FT")
        res.clearCookie("DT")
        console.log(ticket_info)
        res.render("ticket_view", { info: info, ticket_info: ticket_info, user: req.user })

    } else {
        res.redirect("../login") //if not login go to login page
    }
})


module.exports = route