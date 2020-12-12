const pool = require('../../config/database');
const multer = require('multer');

const sendOvaService = (data, file, callback) => {
    console.log(data);
    console.log(file);
    
}

module.exports = {
    sendOvaService
}