

const fs = require('fs');
const path = require('path');
const multer = require('multer');
const upload = multer({ dest: path.dirname(require.main.filename) + '/public/images' });

const {
    createCategory,
    getCategories,
    updateCategory
} = require('./categories.service');


module.exports = {
    createCategory: (req, res) =>{
        const body = req.body;
        //  let EDFile = req.files.file;
        console.log(body);
        
        
        

        createCategory(body, (err, results)=>{
            if(err){
                console.log(err);
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
    getCategories: (req, res) =>{
        getCategories((err, results)=>{
            if(err) throw err;

            return res.json({
                success: 1,
                data: results
            });
        });
    },
    updateCategory: (req, res) => {
        updateCategory((err, res) => {
            if ( err ) throw err;
            console.log(res);
            res.send(res);
        });
    }
}