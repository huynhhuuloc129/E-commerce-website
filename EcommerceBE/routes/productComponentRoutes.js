const express = require('express');
const productComponentController = require('./../controller/productComponentController');

const router = express.Router();

router
  .route('/')
  .get(productComponentController.getAll)
  .post(productComponentController.create);
router
  .route('/:id')
  .get(productComponentController.getOne)
  .delete(productComponentController.delete);

module.exports = router;