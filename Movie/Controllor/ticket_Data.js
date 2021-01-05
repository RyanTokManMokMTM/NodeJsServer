const db = require("../db").db;
const jwt = require("jsonwebtoken"); //user token
const cookie = require("cookie-parser");
const dotenv = require("dotenv")
const { promisify } = require("util")
const generateNum = require("generate-serial-number")


exports.loadTicket = async(req, res, next) => {
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

    db.query("SELECT `Session_info`.`Movie_id`,`Session_info`.`Theater_id`,`Session_info`.`Date` FROM `Session_info` WHERE `Session_info`.`Session_id` = ?", [session_ids], (error, session) => {
        if (error) {
            console.log(error)
            res.send(error)
        } else {
            ticket_session = session
        }
    })
    var ticket_temp = {}
        // db.query("SELECT `Ticket_id` FROM `user_ticket_record`", [], (error, result) => { //count current ticket id 
        //     if (error) {
        //         console.log(error)
        //     } else {
        //         for (var i = 0; i < result.length; i++) {
        //             ticket_temp[result[i].Ticket_id] = result[i].Ticket_id
        //         }
        //     }
        // })
    var ticketNumber
    var ticket_info = []

    for (var key in seat) {
        console.log("gr")
        var seat_id
        db.query("INSERT INTO `Seat_info` SET ?", { Session_id: req.cookies["ticket_movie_info"].session_id, Seat_num: seat[key], Seat_status: true },
            (error, result) => {
                if (error) {
                    console.log(error)
                } else {
                    seat_id = parseInt(result.insertId)
                }
            })
        var price, type, temp;
        if (full != 0 && full_ticket != undefined && full != undefined) {
            price = full_price
            type = "FULL TICKET"
            full--

        } else if (discount != 0 && discount_ticket != undefined && discount != undefined) {
            discount--
            price = discount_price
            type = "DISCOUNT TICKET"
        }
        console.log(ticket_session)
        db.query("INSERT INTO `user_ticket_record` SET ?", { Ticket_id: ticketNumber, Uid: req.user.Uid, Movie_id: ticket_session.Movie_id, Theater_id: ticket_session.Theater_id, Date_id: ticket_session.Date, Seat_id: seat_id, Total_prices: price, Payment_type: "cash_point", Ticket_status: "unuse", Ticket_type: type }, (error, result) => {
            if (error) {
                console.log(error)
            } else {
                var Number = parseInt(result.insertId).toString()
                var PadNumber = Number.padStart(8, '0')
                var ticketNumber = "FX" + PadNumber
                console.log(ticketNumber)

                temp = { "ticketserialnum": ticketNumber, "type": type, "price": price, "seat": seat[key] }
                ticket_info.push(temp)
            }
        })

    }
    // console.log("hi")
    console.log(ticket_info)
    res.clearCookie("ticket_movie_info")
    res.clearCookie("FT")
    res.clearCookie("DT")
    next()
}