const express = require('express');
const pxController = require('./../controller/phieuXuatController');

const router = express.Router();

router
    .route('/')
    .get(pxController.getAllPX)
    .post(pxController.create);
router
    .route('/:id')
    .get(pxController.getOnePX)
// .delete(ptsController.deletePTS);

module.exports = router;
