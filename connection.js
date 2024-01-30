const mysql = require('mysql');
require('dotenv').config();

var kapcsolat = mysql.createConnection({
    port: process.env.DB_PORT,
    host: process.env.DB_HOST,
    user: process.env.DB_USERNAME,
    password: process.env.DB_PASSWORD,
    database: process.env.DB_NAME
});

kapcsolat.connect((err) => {
        if(!err){
            console.log("Az adatbázis kapcsolat létrejött");
            // console.log(kapcsolat);
        }
        else{
            console.log(err);
        }
    }
);

module.exports = kapcsolat;
