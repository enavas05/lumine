const pool = require('../../config/database');
const getAll = () =>{ 
    return new Promise((resolve, reject) => {
        pool.query('SELECT * FROM tblUsers', (err, rows) => {
            if(err) reject(err);
            resolve(rows);
        });
    });
 
}

//Registro de usuarios
const insert = ({username, name, lastname, state, email, password, idRol, idGroup}) => {
    return new Promise((resolve, reject) =>{
        pool.query('INSERT INTO tblUsers (username,name, lastname, state, email, password, idRol,idGroup) VALUES (?,?,?,?,?,?,?,?)',
                [username,name,lastname,state, email, password, idRol,idGroup],
                (err, result) => {
                    if(err) reject(err);
                    if(result){
                        resolve(result);
                    };
                });
    });
}

const getByEmail = (pEmail) => {
    return new Promise((resolve, reject) => {
        pool.query(`SELECT * FROM tblUsers WHERE email = ?`,
                    [pEmail],
                    (err, rows) => {
                        if(err) reject(err);
                        resolve(rows[0]);
        });
    });
}

const getById = (pId) => {
    return new Promise( (resolve, reject) => {
        pool.query('SELECT * FROM tblUsers WHERE id = ?', [pId], (err, rows) => {
            if(err) reject(err);
            resolve(rows[0]);
        });
    });
}

module.exports ={
    getAll,
    insert,
    getByEmail,
    getById
}