const router = require('express').Router();
const uploadFile = require('../../auth/upload');
const upload = require('../../auth/upload');

const {

    createCategory,
    getCategories,
    updateCategory
    

} = require('./categories.controller');

router.get('/', getCategories);
router.post('/create', upload.single('file'), createCategory);
router.put('/update/:id',updateCategory);


module.exports = router;