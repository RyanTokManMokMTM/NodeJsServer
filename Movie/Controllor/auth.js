const db = require("../db").db;
const bcrypt = require("bcryptjs");

exports.register = (req, res) => {
    const { Email, Password, ComfirmPassword, FirstName, LastName } = req.body;
    // console.log(req.body)
    //res.json({ Email, Password, ComfirmPassword, FirstName, LastName }); //  db.query("INSERT INTO user_account(user_email,User_password) VALUE(?,?)", [email, password], (error, result) => {

    //count same email if 0 not exist
    db.query("SELECT count(`email`)> 0 as exist FROM `user` WHERE `email` = ?", [Email], async(error, result) => {
        if (error) {
            console.log(error);
        }

        if (!result[0].exist) {

            //check comfirmpwd
            if (Password == ComfirmPassword) {
                //bcrypt password
                const Hashpwd = await bcrypt.hash(Password, 8);
                console.log(Hashpwd);

                db.query("INSERT INTO `user` SET ?", { email: Email, password: Hashpwd }, (error, result) => {
                    if (error) {
                        console.log(error);
                    }
                    if (result) {
                        return res.render("register");
                    }
                })


            } else {
                // send error message to user
            }


        } else {
            return res.render("register");;
        }
    });
}


exports.login = (req, res) => {
    console.log(req.body.email);
}