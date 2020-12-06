const express = require('express');
const router = express.Router();

const pool = require('../config/database');

router.get('/categories', (req, res) => {
    res.send("Hola mundo")
})

module.exports = router;
