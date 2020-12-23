const db = require("../db").db;
db.getConnection((error) => {
    if (error) {
        console.log(error);
    } else {
        console.log("MYSQL connected...");
    }
});

//getting Theater infomation form db
exports.theater = (req, res, next) => {
    var name = "Horseheads, Regal Arnot Mall"
    db.query("SELECT * FROM `theater_info`", [], (error, result) => {
        if (error) {
            console.log(error)
            return next();
        } else {
            if (!result) {
                return next();
            }
            // console.log(result)
            req.theater = result
            return next()

        }
    })
}

exports.movie_info = (req, res, next) => {
    try {
        // get info from database;
        db.query("SELECT * FROM `movie_info`", [], (error, result) => {
            if (error) {
                console.log(error)
                return next
            } else {
                //if empty
                if (!result) {
                    return next();
                }
                // console.log(result)
                req.movie_infos = result
                return next()
            }
        })
    } catch (error) {
        console.log
        return next()
    }
}