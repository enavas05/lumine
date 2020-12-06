const pool = require('../../config/database');

module.exports = {
    createGroup: (data, callback) => {
        const query = `INSERT INTO tblGroups(name, description)
                       VALUES(?,?)`;
        pool.query(query,
            [
                data.name, 
                data.description
            ],
            (err, results, fields)=>{
                if(err) throw err;
                return callback(null, results);
            });

    },
    getGroups: (callback) => {
        const query = `select * from tblGroups`;
        pool.query(query,
            [],
            (err, results, fields)=>{
                if (err) throw err;
                return callback(null, results);
            })
    }
}