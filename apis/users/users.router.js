require('../../auth/sessionValidation');
const express = require('express');
const router = express.Router();
const Users = require('./users.service');
const bcrypt = require('bcrypt');
const jwt = require('jwt-simple');
const moment = require('moment');
const { Router } = require('express');
//const checkToken = require('../../auth/sessionValidation');



router.get('/', async (req, res) => {
    const users = await Users.getAll();
    res.json(users);
});

router.post('/register', async (req, res) => {
    const body = req.body;
    req.body.password = bcrypt.hashSync(req.body.password, 10);
    const result = await Users.insert(req.body);
    res.json(result);
});

router.post('/login', async(req, res) => {
    const user = await Users.getByEmail(req.body.email);
    if(user === undefined){
        res.json({
            error: 'Error, correo no encontrado'
        });

    }else {
        const equals = bcrypt.compareSync(req.body.password, user.password);
        if(!equals){
            res.json({
                error: 'Error, contraseña incorrecta'
            }); 
        }else {
            res.json({
                succesfull: createToken(user),
                done: 'Login correcto'

            });
        }
    }
});

//router.use(checkToken);

router.get('/mainUser', (req, res) => {

    Users.getById(req.userId)
    .then(rows => {
        res.json(rows);
    })
    .catch(err => {
        console.log(err);
    });


});

const createToken = (user) => {
    let payload = {
        userId: user.id,
        createdAt: moment().unix(),
        expiesAt: moment().add(1, 'day').unix() 
    }

    return jwt.encode(payload, process.env.TOKEN_KEY);
}

module.exports = router;
