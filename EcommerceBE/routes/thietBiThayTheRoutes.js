const express = require('express');
const tbttController = require('./../controller/thietBiThayTheController');

const router = express.Router();

router
  .route('/')
  .get(tbttController.getAllTBTT)
  .post(tbttController.create);
router
  .route('/:id')
  .get(tbttController.getOneTBTT)
  .delete(tbttController.delete);

module.exports = router;
