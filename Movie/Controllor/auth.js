const db = require("../db").db;
const bcrypt = require("bcryptjs");
const jwt = require("jsonwebtoken"); //user token
const cookie = require("cookie-parser");
const dotenv = require("dotenv")
const { promisify } = require("util")



db.getConnection((error) => {
    if (error) {
        console.log(error);
    } else {
        console.log("MYSQL connected...");
    }
});


exports.register = async(req, res) => {
    const { Email, Password, ComfirmPassword, FirstName, LastName } = req.body;
    //res.json({ Email, Password, ComfirmPassword, FirstName, LastName }); //  db.query("INSERT INTO user_account(user_email,User_password) VALUE(?,?)", [email, password], (error, result) => {
    //count same email if 0 not exist


    db.query("SELECT count(`Email`)> 0 as exist FROM `user_info` WHERE `email` = ?", [Email], async(error, result) => {
        if (error) {
            consodle.log(error);
        }
        //Check  password slang is missing!!!!!!!!!!!!
        //Check name slang is missing!!!!!!!!!!!!!

        if (!result[0].exist) {
            //check email length
            if (Email.length < 6) {
                return res.render("register", { message: "Email address is too short." })
            } else if (Email.length > 30) {
                return res.render("register", { message: "Email address is too long." })
            }

            //check comfirmpwd
            if (Password == ComfirmPassword) {

                if (Password.length < 6) {
                    return res.render("register", { message: "Password is too short." })
                } else if (Password.length > 16) {
                    return res.render("register", { message: "Password is too long." })
                }

                //bcrypt password
                const Hashpwd = await bcrypt.hash(Password, 8);
                console.log(Hashpwd);

                await db.query("INSERT INTO `user_info` SET ?", { Email, Password: Hashpwd, FirstName, LastName, Bio: "Hi i'm new user." }, (error, result) => {
                    if (error) {
                        console.log(error);
                    }
                    if (result) {
                        console.log("User info insert successed!")
                        return res.render("register", { message: "Account Registered! Thank you!" });

                        //successed
                    }
                })

            } else {
                // send error message to user
                return res.render("register", { message: "password not match" });
            }
        } else {
            return res.render("register", { message: "Try again! Email is already exist!" });
        }
    });
}

//need to wait for some process done before next 
exports.login = async(req, res) => {
    try {
        // when LoginIn first time
        //Create a JWT and send to client save at cookie
        const { email, Password } = req.body;
        console.log({ email, Password });

        //Checking DB
        //email and  password is null 
        if (!email || !Password) {
            return res.status(400).render("login", { message: "Please enter your email or password." })
                //status 400
        }

        //query db
        db.query("SELECT * FROM `user_info` WHERE `Email` = ?", [email], async(error, result) => {
            if (error) {
                console.log(error)

                return
            }
            if (result.length > 0) {
                if (!result || !(await bcrypt.compare(Password, result[0].Password))) {
                    return res.status(401).render("login", { message: "Email or Password is incorrect." })
                        //status 401 unauth
                } else {
                    //JWT content
                    const id = result[0].Uid;
                    const JWTObj = { id, email };
                    const user_token = jwt.sign(JWTObj, process.env.JWT_KEY, {
                        expiresIn: process.env.JWT_EXPIRED
                    });

                    //Setting cookie
                    const cookie_option = {
                            expires: new Date( //Cookie expired date ms
                                Date.now() + process.env.COOKIE_EXPIRED * 60 * 1000),
                            httpOnly: true, //only http can read by webserver
                            //secure  use https?
                        }
                        // set the cookie with JWT
                    res.cookie("UserJWT", user_token, cookie_option)
                    res.status(200).redirect("/")
                        //status 200 back to homepage
                }
            }
            //if account is not exist or password is no correct(wait this before exit)
            return res.status(401).render("login", { message: "Account not exist." })
        })
    } catch (error) {
        console.log(error);
    }
}

exports.UserAuth = async(req, res, next) => {
    //check having cookie or not
    const userJWT = req.cookies["UserJWT"]
    if (userJWT) { // if cookies include userJWT
        try {
            //  console.log(req.cookies)
            //decode cookie
            //error first (promisify)
            const decodeJWT = await promisify(jwt.verify)(
                userJWT, process.env.JWT_KEY, (error) => {
                    console.log(error)
                    return next()
                }
            );

            console.log(decodeJWT)
            db.query("SELECT * FROM `user_info` WHERE Uid = ?", [decodeJWT.id], (error, result) => {
                if (error) {
                    console.log(error)
                } else {
                    if (!result) { //no any record
                        return next()
                    }

                    req.user = result[0]; // past the data from db to req //it may only 1 record
                    return next()
                }
            })
        } catch (error) {
            console.log(error)
        }
    } else {
        return next()
    }
}

exports.logout = async(req, res) => {
    res.clearCookie("UserJWT");
    res.status(200).redirect("/") // send code 200 and back to home page
}