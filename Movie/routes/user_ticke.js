const { Router } = require("express")
const express = require("express")
const db = require("../db").db
const route = express.Router()
var dateFormat = require('dateformat');
const cookies = require("cookie-parser")

route.get("/Refund/:Ticket_id", (req, res) => {
    var id = req.params.Ticket_id
    db.query("SELECT `user_ticket_record`.`Seat_id` FROM `user_ticket_record` WHERE `user_ticket_record`.`Ticket_id` = ?", [id], (error, result) => {
        if (error) {
            console.log(error)
        } else {
            db.query("DELETE FROM `user_ticket_record` WHERE `user_ticket_record`.`Ticket_id` = ?", [id], (error, results1) => {
                if (error) {
                    console.log(error)
                } else {
                    db.query("DELETE FROM `seat_info` WHERE `seat_info`.`Seat_id` = ?", [result[0].Seat_id], (error, results) => {
                        if (error) {
                            console.log(error)
                        } else {
                            return res.sendStatus(200)

                        }
                    })
                }
            })

        }
    })
})

module.exports = route;