const express = require('express');
const psTbttController = require('./../controller/phieuSuaThietBiThayTheController');

const router = express.Router();

router
    .route('/')
    .get(psTbttController.getAllPsTbtt)
    .post(psTbttController.create)
router
    .route('/:id')
    .get(psTbttController.getAllByPsId)
    .delete(psTbttController.truncate);

module.exports = router;
