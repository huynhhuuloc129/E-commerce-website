const express = require('express');
const productComponentController = require('./../controller/productComponentController');

const router = express.Router();

router
  .route('/')
  .get(productComponentController.getAll)
  // .post(phController.createPH);
router
  .route('/:id')
  .get(productComponentController.getOne)
  // .delete(phController.deletePH);

module.exports = router;
