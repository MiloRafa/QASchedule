var express = require("express");
var app = new express();
var body = require("body-parser");
var cookie = require("cookie-parser");
var mysql = require("mysql");

var con = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: '',
    database: 'qaschedule'
});

app.use(body.urlencoded({extended:false}));
app.use(body.json());

app.set('view engine', 'ejs');

app.use(cookie());

app.get("/",(request, response) => {
   response.render("index");


});



app.listen(8000);