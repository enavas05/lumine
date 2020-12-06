const pool = require('../../config/database');


module.exports = {
    createRole: (data, callback) => {
        
        const query = `INSERT INTO tblRoles(name,archetype, description)
                      VALUES(?,?,?)`;

        pool.query(query,
                   [
                        data.name,
                        data.archetype,
                        data.description
                    ],
                   (err, result, fields) => {
                        if(err) throw err;
                        return callback(null, result);
                   })

    },

    getRoles: (callback) => {
        const query = `SELECT * FROM tblRoles`;
        pool.query(query,(err, results, fielsd) => {
            if(err) throw err;
            return callback(null, results);
        });
    }

}