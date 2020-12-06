const router = require('express').Router();

const {

    createCategory,
    getCategories,
    updateCategory
    

} = require('./categories.controller');

router.get('/', getCategories);
router.post('/create', createCategory);
router.put('/update', updateCategory);

module.exports = router;