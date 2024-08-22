const express = require('express');
const pxController = require('./../controller/phieuXuatController');

const router = express.Router();

router
    .route('/')
    .get(pxController.getAll)
    .post(pxController.create);
router
    .route('/:id')
    .get(pxController.getOne)
// .delete(ptsController.deletePTS);

module.exports = router;
