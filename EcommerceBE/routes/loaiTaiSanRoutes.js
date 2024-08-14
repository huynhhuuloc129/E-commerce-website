const express = require('express');
const ltsController = require('./../controller/loaiTaiSanController');

const router = express.Router();

router
    .route('/')
    .get(ltsController.getAllLTS)
    .post(ltsController.create);
router
    .route('/:id')
    .get(ltsController.getOneLTS)
    .delete(ltsController.delete);

module.exports = router;
