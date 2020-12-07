const express = require('express');
const multer = require('multer');
const util = require('util');


const maxSize = 8 * 1024 * 1024;

let storage = multer.diskStorage({
    destination: (req, file, cb) => {
        cb(null, __dirname + '/public/images/');

    },
    filename: (req, file, cb ) => {
        console.log(file.originalname);
        cb(null, file.originalname);
    }
});

let uploadFile = multer({
    storage,
    limits: {fileSize: maxSize},

}).single('file');

let uploadFileMiddleware = util.promisify(uploadFile);
module.exports = uploadFileMiddleware
//module.exports = uploadFile;