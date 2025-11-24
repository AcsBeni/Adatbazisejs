const express = require('express');
const router = express.Router();
const ejs = require('ejs');
const db = require('./db');
const session = require('express-session');
const pool = require('./db');

/*
DBHOST = localhost
DBUSER = root
DBPASS = 
DBNAME = torpetarna
PORT = 3000
SESSION_SECRET= titkosmikkentyű */


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
    
    ejs.renderFile('./views/torpe-new.ejs', {session: req.session}, (err, html) => {
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
router.get('/delete/:id', (req, res) => {
    const id = req.params.id;

    ejs.renderFile(
        './views/torpe-delete.ejs',
        { session: req.session, id: id },  
        (err, html) => {
            if (err) {
                res.status(500).send('Error rendering page: ' + err);
            } else {
                req.session.error = '';
                res.send(html);
            }
        }
    );
});
//Törpe törlése
router.post('/delete/:id', (req, res) => {
    const id = req.params.id;

    db.query('DELETE FROM torpek WHERE id=?', [id], (err, result) => {
        if (err) {
            req.session.error = 'Hiba történt törlésnél!'
            req.session.severity = 'danger'
            return res.redirect('/');
        }
        res.redirect('/');
    });
});
//Törpe módosítás Form
router.get('/edit/:id', (req, res) => {
    const id = req.params.id;
    db.query('SELECT * FROM torpek WHERE id=?', [id], (err, results) => {
        if (err || results.length === 0) {
            req.session.error = 'Hiba történt a betöltésnél!'
            req.session.severity = 'danger'
            return res.redirect('/');
        }
        ejs.renderFile('./views/torpe-edit.ejs', { session: req.session, id: id ,data: results[0]  }, (err, html) => {
            if (err) {
                res.status(500).send('Error rendering page');
            } else {
                req.session.error = '';
                res.send(html);
            }
        });
    });
});
//Törpe módosítás POST
router.post('/edit/:id', (req, res) => {
    const id = req.params.id;
    const { nev, klan, nem, suly, magassag } = req.body;

    db.query(
        'UPDATE torpek SET nev=?, klan=?, nem=?, suly=?, magassag=? WHERE id=?',
        [nev, klan, nem, suly, magassag, id],
        (err, result) => {
            if (err) {
                req.session.error = 'Hiba történt mentésnél!';
                req.session.severity = 'danger';
                return res.redirect(`/edit/${id}`);
            }
            res.redirect('/');
        }
    );
});
    

module.exports = router;