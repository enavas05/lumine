const express = require('express');
const {

    sendOvaService
    
}  = require('./ovas.service');

const sendOva = (req, res) => {
    const body = req.body;
    const originalname = req.file.originalname;

    sendOvaService(body, originalname, (err, result) => {
        if (err) {
            console.log(err);
            return res.status(500).json({
                success: 0,
                message: 'Error de conexión'
            });
        }

        return res.status(200).json({
            success: 1,
            data: results
        });
    });
    
}

module.exports = {
    sendOva
}