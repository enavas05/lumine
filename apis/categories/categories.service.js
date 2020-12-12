const pool = require('../../config/database');
const multer   = require('multer');


module.exports =  {
    createCategory: async (data, file, callback) => {
        const query = `INSERT INTO tblCategory(name, description, visible, image) 
                        VALUES(?,?,?,?)`;
        const duplicated = `SELECT * from tblCategory WHERE name = ?`;

        const expreg = /[A-Za-z0-9]/;
        
        console.log(file);
        pool.query(duplicated, [data.name], (err, result) => {
            //console.log(result)
            if(result.length > 0){
                const message = "ya existe una categoría con ese nombre";
                return callback(null, message);
            }else {
                pool.query(query, 
                    [
                        data.name,
                        data.description,
                        data.visible,
                        file
        
                    ],
                    (err, results, fields) => {
                        if(err) throw err;
                        return callback(null, results);
                });
            }
        })
    },
    getCategories: async (callback) => {
        const query = 'SELECT id, name, description, visible,image FROM tblCategory';
         await pool.query(query, 
                    [], 
                    (err, results, fields )=>{
                        if (err) throw err;
                        return callback(null, results);
                    });
    },
    updateCategory: (id, data, callback) => {
        
        const query = `UPDATE tblCategory SET name = ? , description = ?, visible = ?, image = ? 
        WHERE id = ${id}`;

        pool.query(query, [data.name, data.description, data.visible, data.image], (err, result) => {
            if (err) throw err;

            if(result.affectedRows === 0 ){
                return callback(null,{message: "No encontrado"});
            }
            
            return callback(null, {
                id,
                ...data
            });

        });
    }
}