const express = require('express');
const prodController = require('./../controller/productController');

const router = express.Router();

router
    .route('/')
    .get(prodController.getAll)
    .post(prodController.create);
router
    .route('/:id')
    .get(prodController.getOne)
    .delete(prodController.delete);
router
    .route('/brand/:id')
    .get(prodController.getAllByBrandId)

module.exports = router;
