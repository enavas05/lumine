const uploadFile = require('../../auth/upload');
const fs  = require('fs');
const path = require('path');
const { dir } = require('console');

const upload = async (req, res) => {
    const body = req.body;
    console.log(body)
    try {
        await uploadFile(req, res);
        
        if(req.file = undefined) {
            return res.status(400).send({
                message: 'Porfavor adjunte un archivo'
            })
        }

        res.status(200).send({
            message: `Archivo enviado: ${req.file.originalname}`
        });



    } catch (err) {
            if(err.code == 'LIMIT_FILE_SIZE'){
                return res.status(500).send({
                    message: `Could not upload the file: ${req.file.originalname}. ${err}`,
                });
            }

            res.status(500).send({
                message: `Could not upload the file: ${req.file.originalname}. ${err}`,
              });
                
    }
};

const getListFiles = (req, res) => {
    const directoryPath = path.dirname(require.main.filename) + '/public/images';
    
    fs.readdir(directoryPath, (err, files) => {

        if (err) {
            res.status(500).send({
              message: "Unable to scan files!",
            });
        }

        let fileInfos = [];


        files.forEach((file) => {
            fileInfos.push({
              name: file,
              url: directoryPath + file
            });
        });

        res.status(200).send(fileInfos);
    })
};

const download = (req, res) => {
    const fileName = req.params.name;
    const directoryPath = `${__dirname}/public/images`;
    console.log(__dirname);

    res.download(directoryPath + fileName, fileName, (err) => {
        if(err) {
            res.status(500).send({
                message: 'No se pudo descargar el archivo. ' + err
            })
        }
    });

};

module.exports = {
    upload,
    getListFiles,
    download
}