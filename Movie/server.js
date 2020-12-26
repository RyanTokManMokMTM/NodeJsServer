const db = require("./db");
const env = require("dotenv");
const express = require("express");
const path = require("path");
var bodyParser = require('body-parser');
const cookieParser = require("cookie-parser");
const route = express.Router();

const server = express();
server.set("view engine", "ejs")

env.config({ path: "./.env" })

//set static file folder(css js etc) / = currentDire and Public Dir
const publicDicection = path.join(__dirname, "./public")
server.use(express.static(publicDicection))
server.use(express.urlencoded({ extended: false })) //allow check url req
server.use(express.json()) // parse json by API server read json
server.use(cookieParser())
    //set server view engine as ejs file

server.use("/", require("./routes/page")) // when server get with / or /xxx /xxxxe etc  will go into routes page js to match
server.use("/auth", require("./routes/auth")) // when server get with / or /xxx /xxxxe etc  will go into routes page js to match
server.use("/info", require("./routes/info")) // when server get with / or /xxx /xxxxe etc  will go into routes page js to match
server.use("/data", require("./routes/getData"))

//Server setting
server.listen(9001, () => {
    console.log("Server listening on 127.0.0.1:9001...");
})