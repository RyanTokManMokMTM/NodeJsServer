const mysql = require("mysql");
const env = require("dotenv");
env.config({
    path: "./.env"
});

const db = mysql.createPool({
    host: process.env.DB_HOST,
    port: process.env.DB_PORT,
    user: process.env.DB_USER,
    password: process.env.DB_PASSWORD,
    database: process.env.DB_DATABASE
});

module.exports.db = db;