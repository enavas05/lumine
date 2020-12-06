const router = require('express').Router();
const { checkToken } = require("../../auth/tokenValidation");

const {

    createGroup,
    getGroups
    

} = require('./groups.controller');

router.get('/', checkToken, getGroups);
router.post('/', checkToken, createGroup);

module.exports = router;