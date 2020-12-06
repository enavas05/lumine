const jwt = require('jwt-simple');
const moment = require('moment');

const checkToken = (req, res, next) => {

    if(!req.headers['user_token'])
        return res.json({
            error: 'Debers incluir los headers'
        });
    

    const token =  req.headers['user_token'];
    let payload = null;

    try {
        payload = jwt.decode(token, process.env.TOKEN_KEY);
    }catch(err){
        return res.json({
            error: 'token invalido'
        });
    }

    if(moment().unix() > payload.expiresAt){
        return res.json({
            error: 'Token expiró'
        });
    }
    req.userId = payload.userId;
    next();

}

module.exports = checkToken;