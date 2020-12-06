const express = require('express');
const router = express.Router();
const {
    upload,
    getListFiles,
    download
} = require('./ovas.controller');


router.post("/upload", upload);
router.get("/files", getListFiles);
router.get("/files/:name", download);

module.exports = router;