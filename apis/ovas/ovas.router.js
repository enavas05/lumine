const express = require('express');
const router = express.Router();
const uploadFile = require('../../auth/upload');
const {
    sendOva,
    getListFiles,
    download
} = require('./ovas.controller');


router.post("/send", uploadFile.single('file'), sendOva);
//router.get("/", getListFiles);
//router.get("/:name", download);

module.exports = router;