require('dotenv').config();
const express = require('express');
var session = require('express-session')
const mysql = require('mysql');
const app = express();
const port = process.env.PORT || 3000;
const routes = require('./modules/torpek');

//Middleware
app.use(express.json());
app.use(express.urlencoded({ extended: true }));
app.use('/assets', express.static('assets'));
app.use(session({
    secret  : process.env.SESSION_SECRET
}));
//Routes
app.use('/', routes);

app.listen(port, () => {
  console.log(`Server is running on port ${port}`);
});


