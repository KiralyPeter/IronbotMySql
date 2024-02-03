const express = require("express");
const connection = require("../connection");
const router = express.Router();

const jwt = require("jsonwebtoken");
require("dotenv").config();

router.post("/signup", (req, res) => {
  let user = req.body;
  query = "SELECT Email FROM shortuser WHERE Email=?";
  connection.query(query, [user.Email], (err, results) => {
    if (!err) {
      if (results.length <= 0) {
        query =
          "INSERT INTO `shortuser` (`Id`, `Username`, `Password`, `Email`, `TimeStamp`) VALUES (NULL,?,?,?,current_timestamp())";
        connection.query(
          query,
          [user.Username, user.Password, user.Email],
          (err, results) => {
            if (!err) {
              return res.status(200).json({ message: "Sikeres regisztráció" });
            } else {
              return res.status(500).json(err);
            }
          }
        );
      } else {
        return res.status(400).json({ message: "Az email cím már létezik" });
      }
    } else {
      return res.status(500).json(err);
    }
  });
});

// router.get('/listuser',(req,res) =>{
//     query = "SELECT * FROM shortuser";
//     connection.query(query,(err,results)=>{
//         if(!err){
//             return res.json({message: "valami"});
//         }else{
//             return res.status(500).json(err);
//         }

//     })

// })

router.post("/login", (req, res) => {
  const user = req.body;
  query = "SELECT Username, Password, Email FROM shortuser WHERE Email = ?";
  connection.query(query, [user.Email], (err, results) => {
    if (!err) {
      if (results.length <= 0 || results[0].Password != user.Password) {
        return res
          .status(401)
          .json({ message: "Hibás felhasználó név vagy jelszó..." });
      } else if (results[0].Password == user.Password) {
        const response = { Email: results[0].Email };
        const accessToken = jwt.sign(response, process.env.ACCESS_TOKEN, {
          expiresIn: "8h",
        });
        res.status(200).json({ token: accessToken });
      } else {
        return res.status(400).json({ message: "Egyébn hiba történt..." });
      }
    } else {
      return res.status(500).json(err);
    }
  });
});

module.exports = router;
