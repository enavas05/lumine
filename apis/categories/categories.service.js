const pool = require('../../config/database');
const multer   = require('multer');
const upload = multer({dest: '../public/uploads'});

module.exports =  {
    createCategory: (data, callback) => {
        const query = `INSERT INTO tblCategory(name, description, visible, image) 
                        VALUES(?,?,?,?)`;
        const duplicated = `SELECT * from tblCategory WHERE name = ?`;

        const expreg = /[A-Za-z0-9]/;

        pool.query(duplicated, [data.name], (err, results) => {
            if(results.length > 0 ){
                console.log('categoria ya existe');
                results = {
                    success: "0",
                    message: "Categoría ya existe"
                }
                return callback(null, results)
            } else if ( !expreg.test(data.name)){
                console.log('nombre incorrecto');
            }else {
                pool.query(query, 
                    [
                        data.name,
                        data.description,
                        data.visible,
                        data.image
 
                    ],
                    (err, results, fields) => {
                        if(err) throw err;
                        
                        return callback(null, results);
            });
            }
        });
    },
    getCategories: (callback) => {
        const query = 'SELECT id, name, description, visible FROM tblCategory';
        pool.query(query, 
                    [], 
                    (err, results, fields )=>{
                        if (err) throw err;
                        return callback(null, results);
                    });
    },
    updateCategory: (confirm) => {
        console.log('object')
    }
}