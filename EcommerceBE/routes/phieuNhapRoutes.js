const express = require('express');
const pnController = require('./../controller/phieuNhapController');

const router = express.Router();

router
    .route('/')
    .get(pnController.getAllPN)
    .post(pnController.create);
router
    .route('/:id')
    .get(pnController.getOnePN)
// .delete(ptsController.deletePTS);

module.exports = router;
