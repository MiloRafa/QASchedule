var express = require("express");
var app = new express();
var cookie = require("cookie-parser");
var router = require("./router");


app.set('view engine', 'ejs');

app.use(cookie());

app.use("/",router);


app.listen(8000);