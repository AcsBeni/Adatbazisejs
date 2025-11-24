const express = require('express');
const router = express.Router();
const ejs = require('ejs');
const db = require('./db');

router.get('/', (req, res) => {
    db.query('SELECT * FROM torpek', (err, results) => {
       console.log(results);
       ejs.renderFile('./views/index.ejs', { results }, (err, html) => {
        if (err) {
            res.status(500).send('Error rendering page');
        } else {
            res.send(html);
        }
    });
    }
);

    

   
})

module.exports = router;