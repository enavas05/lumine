const {
    createRole,
    getRoles
} = require('./roles.service');

module.exports = {
    createRole: (req, res) => {
        const body = req.body;

        createRole(body, (err, results) => {
            if(err){
                //console.log(err);
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
    },
    getRoles: (req, res) => {
        getRoles ((err, results) => {
            if(err) throw err;

            return res.json({
                succes: 1,
                data: results 
            })
        });
    }
}