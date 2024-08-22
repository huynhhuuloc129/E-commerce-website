const express = require('express');
const tagController = require('./../controller/tagController');

const router = express.Router();

router
    .route('/')
    .get(tagController.getAll)
    // .post(psTbttController.create)
router
    .route('/:id')
    // .get(psTbttController.getAllByPsId)
    // .delete(psTbttController.truncate);

module.exports = router;
