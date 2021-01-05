const db = require("../db").db;
const jwt = require("jsonwebtoken"); //user token
const cookie = require("cookie-parser");
const dotenv = require("dotenv")
const { promisify } = require("util")
const generateNum = require("generate-serial-number")
const dataformats = require("dateformat")


exports.loadTicket = (req, res, next) => {
    if (req.user) {
        var ticket_session
        var user_point = req.user.Cash_point //updated user cashpoint
        var info = req.cookies["ticket_movie_info"].movie_info
        req.movie_info = info // add to request
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
        var seat_info = []
        var seat_info_db = []
        var ticket_info = []
        var ticket_db_info = []
            //{ Ticket_id: ticketNumber, Uid: req.user.Uid, Movie_id: session.Movie_id, Theater_id: session.Theater_id, Date_id: session.Date, Seat_id: seat_id, Total_prices: price, Payment_type: "cash_point", Ticket_status: "unuse", Ticket_type: type }, (error, result)

        for (var key in seat) {
            var temp = { Session_id: req.cookies["ticket_movie_info"].session_id, Seat_num: seat[key], Seat_status: true } //same size
            var temp_db = [req.cookies["ticket_movie_info"].session_id, seat[key], true] //same size
            seat_info.push(temp)
            seat_info_db.push(temp_db)
        }

        db.query("SELECT `Session_info`.`Movie_id`,`Session_info`.`Theater_id`,`Session_info`.`Date` FROM `Session_info` WHERE `Session_info`.`Session_id` = ?", [session_ids], (error, session) => {
            if (error) {
                console.log(error)
                res.send(error)
            } else {
                db.query("INSERT INTO `Seat_info`(`Session_id`,Seat_num,Seat_status) VALUES ?", [seat_info_db], (error, result) => {
                    if (error) {
                        console.log(error)
                    } else {
                        var seat_id_row = []
                        for (var i = result.insertId; i < result.insertId + result.affectedRows; i++) {
                            seat_id_row.push(i)
                        }
                        var i = 0
                        for (var key in seat) {
                            var type, price
                            if (full != 0 && full_ticket != undefined && full != undefined) {
                                price = full_price
                                type = "FULL TICKET"
                                full--

                            } else if (discount != 0 && discount_ticket != undefined && discount != undefined) {
                                discount--
                                price = discount_price
                                type = "DISCOUNT TICKET"
                            }
                            var temp2 = { "type": type, "price": price, "seat": seat[key] } //same size
                            ticket_info.push(temp2)

                            var ticket_session = session
                                // console.log(ticket_session)
                            var t_temp = [req.user.Uid, ticket_session[0].Movie_id, ticket_session[0].Theater_id, ticket_session[0].Date, seat_id_row[i], price, "cash_point", "unuse", type]
                                // console.log(t_temp)
                            ticket_db_info.push(t_temp)
                            i++
                        }

                        db.query("INSERT INTO `user_ticket_record`(`Uid`,`Movie_id`,`Theater_id`,`Date_id`,Seat_id,`Total_prices`,`Payment_type`,`Ticket_status`,`Ticket_type`) VALUES ?", [ticket_db_info], (error, result_1) => {
                            if (error) {
                                console.log(error)
                            } else {
                                var user_ticket_id = []
                                for (var i = result_1.insertId; i < result_1.insertId + result_1.affectedRows; i++) {
                                    var str = parseInt(i).toString()
                                    var Ticket_number = "FX" + str.padStart(8, '0')
                                    user_ticket_id.push(Ticket_number)
                                }

                                for (var i = 0; i < ticket_info.length; i++) {
                                    ticket_info[i]["ticketserialnum"] = user_ticket_id[i]
                                }
                                //  console.log(ticket_info)
                                req.info = ticket_info
                                next()
                            }
                        })

                    }
                })
            }
        })
    } else {
        next()
    }
}

exports.loadUserOwnTicket = (req, res, next) => {
    if (req.user) {
        var uid = req.user.Uid
            //TODO get uid ticket list with unuse
        db.query("SELECT `user_ticket_record`.`Ticket_id`,`user_ticket_record`.`Total_prices`,`user_ticket_record`.`Payment_type`,`user_ticket_record`.`Ticket_type`,`Movie_info`.`Movie_name`,`Movie_info`.`Movie_restricted_level`,`Theater_info`.`Theater_name`,`movie_date_info`.`Date`,`movie_date_info`.`Time` ,`Seat_info`.`Seat_num` FROM `user_ticket_record` INNER JOIN `Movie_info` on `user_ticket_record`.`Movie_id` = `Movie_info`.`Movie_id` INNER JOIN `Theater_info` ON `user_ticket_record`.`Theater_id`= `Theater_info`.`Theater_id` INNER JOIN `movie_date_info` ON `user_ticket_record`.`Date_id` = `movie_date_info`.`Movie_date_id` INNER JOIN `seat_info` ON `user_ticket_record`.`seat_id` =`seat_info`.`Seat_id` WHERE `user_ticket_record`.`Uid` = ? ORDER BY `Movie_info`.`Movie_name`", [uid], (error, result) => {
            if (error) {
                console.log(error)
            } else {
                console.log("test")
                    //   console.log(result)
                let ticket_info = result
                for (var i = 0; i < result.length; i++) {
                    let ticket_num = result[i].Ticket_id
                    let Ticket_Number = ticket_num.toString()
                    let Ticket_serial_num = "FX" + Ticket_Number.padStart(8, '0')
                    ticket_info[i]["TicketNum"] = Ticket_serial_num
                    let temp = result[i].Date
                    let temp_date = dataformats(temp, "fullDate")
                    ticket_info[i].Date = temp_date

                    let temp_time = result[i].Time
                    let temp_time_s = temp_time.slice(0, -3)
                    ticket_info[i].Time = temp_time_s
                }
                //console.log(ticket_info)
                req.user_ticket = ticket_info
                    //  console.log(ticket_info)
                next()
            }
        })
    } else {
        next()
    }
}