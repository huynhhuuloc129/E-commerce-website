const express = require('express');
const tbttController = require('./../controller/thietBiThayTheController');

const router = express.Router();

router
  .route('/')
  .get(tbttController.getAll)
  .post(tbttController.create);
router
  .route('/:id')
  .get(tbttController.getOne)
  .delete(tbttController.delete);

module.exports = router;
