const express = require('express');
const router = express.Router();
const ejs = require('ejs');
const db = require('./db');
const session = require('express-session');
const pool = require('./db');



//Törpe lista
router.get('/', (req, res) => {
    db.query('SELECT * FROM torpek', (err, results) => {
       
       if (err) {
        return res.status(500).send('Database query error');
        }
       ejs.renderFile('./views/index.ejs', { results }, (err, html) => {
        if (err) {
            res.status(500).send('Error rendering page');
        } else {
            res.send(html);
        }
    });
    });
});
//Törpe hozzáadás Form
router.get('/new', (req, res) => {
    
    ejs.renderFile('./views/torpe-form.ejs', {session: req.session}, (err, html) => {
    if (err) {
      res.status(500).send('Error rendering page');
    } else {
    req.session.error = '';
      res.send(html);
    }
    });
    
});
//Törpe hozzáadás POST
router.post('/new', (req, res) => {
    const { nev,klan, nem, suly, magassag } = req.body;
    if(nev =='' || klan =='' || Number(suly)==0 || Number(magassag) ==0 ||nem ==''){
        req.session.error = 'Nem adtál meg minden adatot!'
        req.session.severity = 'danger'
        return res.redirect('/new')
        
    }
    db.query('INSERT INTO torpek (nev, klan, nem, suly, magassag) VALUES (?, ?, ?, ?, ?)', [nev, klan, nem, suly, magassag], (err, result) => {
        if (err) {
            req.session.error = 'Hiba történt mentésnél!'
            req.session.severity = 'danger'
            return res.redirect('/new')
        }
        res.redirect('/');
    });
});
//Törpe törlés

module.exports = router;