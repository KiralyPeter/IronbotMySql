const express = require('express');
const connection = require('../connection');
const router = express.Router();

router.post('/signup',(req, res) => {
    let user = req.body;
    query = "SELECT Email FROM shortuser WHERE Email=?";
    connection.query(query, [user.Email],(err,results)=>{
        if(!err){
            if(results.length <= 0){
                query = "INSERT INTO `shortuser` (`Id`, `Username`, `Email`, `TimeStamp`) VALUES (NULL,?,?,current_timestamp())"
                connection.query(query,
                    [
                        user.Username,                        
                        user.Email                       
                    ],
                    (err,results) =>{
                        if(!err){
                            return res.status(200).json({message: "Sikeres regisztráció"});
                        }
                        else{
                            return res.status(500).json(err);
                        }
                    }

                    )
            } else {
                return res.status(400).json({message: "Az email cím már létezik"});
            }
        } else{
        return res.status(500).json(err);
    }
    });
    
});


router.get('/listuser',(req,res) =>{
    query = "SELECT * FROM shortuser";
    connection.query(query,(err,results)=>{
        if(!err){
            return res.json({message: "valami"});
        }else{
            return res.status(500).json(err);
        }

    })
    
    
})

module.exports = router;