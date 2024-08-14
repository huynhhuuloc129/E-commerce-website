const express = require('express');
const dvbhController = require('./../controller/donViBanHangController');

const router = express.Router();

router
    .route('/')
    .get(dvbhController.getAllDVBH)
    .post(dvbhController.create);
router
    .route('/:id')
    .get(dvbhController.getOneDVBH)
    .delete(dvbhController.delete);

module.exports = router;
