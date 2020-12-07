

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
        const {id} = req.params;
        const body = req.body;
        console.log(id);

        updateCategory(id, body, (err, result) => {
            if(err){
                console.log(err);
                return res.status(500).json({
                    success: 0,
                    message: 'Error de conexión'
                });
            }

            return res.status(200).json({
                success: 1,
                data: result
            });
        })
        
    }
}