const express = require('express');
const multer = require('multer');
const util = require('util');
const path = require('path');


//const maxSize = 8 * 1024 * 1024;

let storage = multer.diskStorage({
    destination: (req, res, cb) => {
        cb(null, path.dirname(require.main.filename) + '/public/images/');

    },
    filename: (req, file, cb ) => {
        //console.log(file.originalname);
        cb(null, file.originalname);
    }
});

let uploadFile = multer({
    storage,
    //limits: {fileSize: maxSize},

});

//let uploadFileMiddleware = util.promisify(uploadFile);
//module.exports = uploadFileMiddleware
module.exports = uploadFile;