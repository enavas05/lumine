const express = require('express');
const router = express.Router();

const pool = require('../config/database');

router.get('/', (req, res) => {
    res.send('Hello World');
});

router.get('/categories', (req, res) => {
    pool.query('Select * from tblCategory', (err, rows, fields) => {
             if(!err){
                 console.log(JSON.stringify({rows}));
                 res.send(JSON.stringify({rows}));
             }
        })
    
});

router.get('/categories/:id', (req, res) => {
    let {id} = req.params;

    pool.query('Select * from tblCategory WHERE id = ?', [id], (err, rows, fields) => {
             if(!err){
                console.log(JSON.stringify({rows}));
                length = rows.filter(function(item){
                    return item.is_read;
                  }).length;
                console.log(id);
                console.log(length);
             }

             if(rows.length ===''){
                 console.log('no se enctontraron datos');
                 res.send(JSON.stringify({
                    message: 'Datos vacíos'
                 }));
             }
             res.send(JSON.stringify({rows}));
        })
    
});

module.exports = router;