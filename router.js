var express = require("express");
var router = express.Router();
var body = require("body-parser");
var cookie = require("cookie-parser");
var mysql = require("mysql");
var async = require("async");

router.use(cookie());
router.use(body.urlencoded({extended: false}));
router.use(body.json());

var con = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: '',
    database: 'qaschedule'
});

router.get("/", (request, response) => {
    var query = "SELECT schedule.schedule_id AS sID,trainer_information.name AS tName,room_information.title AS rName, room_information.capacity AS rCap, group_information.name AS gName, skills.skill as skill, schedule.date AS date FROM schedule, room_information,trainer_information, group_information, skills WHERE schedule.room_id=room_information.room_id AND schedule.trainer_id=trainer_information.trainer_id AND schedule.group_id= group_information.group_id AND schedule.skill_id=skills.skill_id"
    con.query(query,(err,result) => {
        var results = [];
        if (err) console.log(err);
        else {
            if (result.length > 0) {
                console.log("hello");
                result.forEach( row => {
                    results.push({
                        sID: row.sID,
                        tName: row.tName,
                        rName: row.rName,
                        rCap: row.rCap,
                        gName: row.gName,
                        skill: row.skill,
                        date: row.date
                    });
                    console.log(results)
                });
            }
        }
            var dataObject = {
                results:results
            }
        response.render("index",{data:dataObject});
        });
});

router.get("/date", (request,response) => {
    response.render("date");
});

router.post("/subject", (request,response) => {
    var date = request.body.date;
    response.cookie('date',date);

    con.query("SELECT * FROM skills",(err,results) => {
        var subjects = [];
        if(err) console.log(err);
        else{
            results.forEach(subject => {
                subjects.push({
                    skillid: subject.skill_id,
                    subject:subject.skill
                })
            })
        }
        var responseData = {
            date:date,
            subjects: subjects
        }
        response.render("subject", {data:responseData})
    })

});

router.post("/group", (request,response) => {
    var subject = request.body.subject;
    response.cookie("subject",subject);
    var groupQuery = `SELECT DISTINCT name, t1.group_id FROM group_information t1 LEFT JOIN schedule t2 ON t2.group_id = t1.group_id WHERE t2.group_id IS NULL OR t2.date != '${request.cookies.date}'`
    console.log(groupQuery);
    var groups = [];
    con.query(groupQuery, (err,result) =>{
        if(err) console.log(err);
        else {
            result.forEach(group => {
                groups.push({
                    groupName: group.name,
                    groupId: group.group_id
                })
            })
            console.log(groups);
        }
        var responseData = {
            date:request.cookies.date,
            subject:subject,
            groups: groups
        }
        response.render("group",{data:responseData})
    })
})











module.exports = router;