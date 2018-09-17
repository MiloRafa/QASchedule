var express = require("express");
var router = express.Router();
var body = require("body-parser");
var cookie = require("cookie-parser");
var mysql = require("mysql");

router.use(cookie());

var con = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: '',
    database: 'qaschedule'
});

router.get("/", (request, response) => {
    let results = [];
    var query = "SELECT trainer_information.name,group_information.name,schedule.date,room_information.title FROM (((`schedule` INNER JOIN room_information ON schedule.room_id=room_information.room_id) INNER JOIN trainer_information ON schedule.trainer_id=trainer_information.trainer_id) INNER JOIN group_information ON schedule.room_id=room_information.room_id)"
    con.query(query,(err,result) => {
       if (err) console.log(err);
       else {
           if (result.length > 0) {
               result.forEach( row => {
                   console.log(row);
                   results.push({
                       name: row.name
                   });
               });
           }
       }
    });
    console.log(results);
    response.render("index",{data:results});
});











module.exports = router;