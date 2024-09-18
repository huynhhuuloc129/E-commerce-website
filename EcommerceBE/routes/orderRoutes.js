const express = require('express');
const orderController = require('./../controller/orderController');

const router = express.Router();

router
  .route('/')
  .get(orderController.getAll)
  .post(orderController.create);
router
  .route('/:id')
  .get(orderController.getOne)
  .delete(orderController.delete);

module.exports = router;
