const express = require('express');
const brandController = require('./../controller/brandController');

const router = express.Router();

router
    .route('/')
    .get(brandController.getAll)
    .post(brandController.create);
router
    .route('/:id')
    .get(brandController.getOne);
    // .delete(dvbhController.delete);

module.exports = router;
