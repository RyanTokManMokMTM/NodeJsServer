const db = require("../db").db;
const dateformat = require("dateformat")
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
                var MovieList = result
                    //  console.log(MovieList)
                for (var i = 0; i < result.length; i++) {
                    // console.log(result[i])
                    var dateTemp = dateformat(result[i].Movie_release_date, "mmmm dS, yyyy")
                    MovieList[i].Movie_release_date = dateTemp
                }
                req.movie_infos = MovieList
                return next()
            }
        })
    } catch (error) {
        console.log
        return next()
    }
}