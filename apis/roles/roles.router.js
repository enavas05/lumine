const router = require('express').Router();
const { checkToken } = require("../../auth/tokenValidation");

const {

    createRole,
    getRoles
    

} = require('./roles.controller');

router.get('/',  getRoles);
router.post('/',  createRole);

module.exports = router;