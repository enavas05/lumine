const pool = require('../../config/database');

module.exports = {
    createUser: (data, callback) => {
        const query = `INSERT INTO tblUsers(username, name, lastname, state, email, password, idRol, idGroup)
        VALUES(?,?,?,?,?,?,?,?)`;

        pool.query(query,
                [
                  data.username,
                  data.name,
                  data.lastname,
                  data.state,
                  data.email,
                  data.password,
                  data.idRol,
                  data.Group
                ],

                (err, results, fields) => {
                    if(err) throw err;
                    return callback(null, results);
                });
    },
    getUsers: (callback) => {
        const query = `select id, usuario,nombre,estado,email from tblUsers`;
        pool.query(
            query,
            [],
            (error, results, fields) => {
              if (error) {
                callBack(error);
              }
              return callack(null, results);
            }
          );
    },
    getUserByUserEmail:(data, callack) => {
      console.log('usuarios');
    }
}