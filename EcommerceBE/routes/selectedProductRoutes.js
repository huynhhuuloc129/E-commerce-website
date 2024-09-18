const express = require('express');
const selectedProductController = require('./../controller/selectedProductController');

const router = express.Router();

router
  .route('/')
  .get(selectedProductController.getAll)
  .post(selectedProductController.create);
router
  .route('/:id')
  .get(selectedProductController.getOne)
  .delete(selectedProductController.delete);

module.exports = router;
