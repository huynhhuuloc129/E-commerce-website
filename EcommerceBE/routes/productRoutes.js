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
    .patch(prodController.update)
    .delete(prodController.delete);
router
    .route('/detail/:id')
    .get(prodController.getOneDetails);
router
    .route('/brand/:id')
    .get(prodController.getAllByBrandId);

module.exports = router;
