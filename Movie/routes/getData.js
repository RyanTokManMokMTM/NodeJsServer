const { Router } = require("express")
const express = require("express")
const db = require("../db").db
const route = express.Router()
var dateFormat = require('dateformat');

//Get related theater movie list
route.get("/MovieData/:Selected_Theater_id", (req, res) => {

    var id = req.params.Selected_Theater_id
    db.query("SELECT  `Theater_info`.`Theater_id`, `Movie_info`.`Movie_name`, `Movie_info`.`Movie_id` FROM `Session_info` INNER JOIN `Theater_info` ON `Session_info`.`Theater_id` = `Theater_info`.`Theater_id` INNER JOIN `Movie_info` ON `Movie_info`.`Movie_id` = `Session_info`.`Movie_id` WHERE `Session_info`.`Theater_id` = ?", [id], (error, result) => {
        if (error) {
            console.log(error)
            return res.statusCode = 400
        } else {
            return res.send(result)
        }
    })

})

//Get related movie date list
route.get("/MovieDate/:Selected_Theater_id/:Selected_Movie_id", (req, res) => {
    const { Selected_Theater_id, Selected_Movie_id } = req.params
        // console.log(Selected_Theater_id, Selected_Movie_id)

    //get Date in session info
    db.query("SELECT `Movie_date_info`.`Date_id`,`Movie_date_info`.`Date`,`Movie_date_info`.`Time` FROM `Session_info` INNER JOIN `Movie_date_info` ON `Session_info`.`Date` = `Movie_date_info`.`Movie_date_id` WHERE `Session_info`.`Theater_id` = ? AND `Session_info`.`Movie_id` = ?", [Selected_Theater_id, Selected_Movie_id], (error, result) => {
        if (error) {
            console.log(error)
            return res.statusCode = 400
        } else {
            //console.log(result)

            //change Date format
            var converDate_Data = result
            for (var i = 0; i < result.length; i++) {
                var temp_date = result[i].Date
                    // var temp_time = result[i].Time
                var temp = dateFormat(temp_date, "fullDate")
                    //var temp2 = dateFormat(temp_time, "HH:MM")
                converDate_Data[i].Date = temp
                    // converDate_Data[i].Time = temp2
            }
            //  console.log(converDate_Data)
            res.send(converDate_Data)
        }
    })
})

//Gee related movie date time list
route.get("/MovieDate/:Selected_Theater_id/:Selected_Movie_id/:Selected_date_id", (req, res) => {
    const { Selected_Theater_id, Selected_Movie_id, Selected_date_id } = req.params
        // console.log(Selected_Theater_id, Selected_Movie_id)
    db.query("SELECT `Session_info`.`Session_id`,`Movie_date_info`.`Date`,`Movie_date_info`.`Time` FROM `Session_info` INNER JOIN `Movie_info` ON `Session_info`.`Movie_id` = `Movie_info`.`Movie_id` INNER JOIN `Theater_info` ON `Session_info`.`Theater_id` = `Theater_info`.`Theater_id` INNER JOIN `Movie_date_info` ON `Session_info`.`Date` = `Movie_date_info`.`Movie_date_id` WHERE `Session_info`.`Theater_id` = ? AND `Session_info`.`Movie_id` = ? AND `Movie_date_info`.Date_id", [Selected_Theater_id, Selected_Movie_id, Selected_date_id], (error, result) => {
        if (error) {
            console.log(error)
            return res.statusCode = 400
        } else {
            // console.log(result)
            var TimeFormat = result
            for (var i = 0; i < result.length; i++) {
                var temp = result[i].Time.slice(0, -3) // delted last 3 :ss
                TimeFormat[i].Time = temp
            }
            //console.log(TimeFormat)
            return res.send(TimeFormat)
        }
    })
})



module.exports = route;