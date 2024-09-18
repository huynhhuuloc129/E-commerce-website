const express = require('express');
const paymentController = require('./../controller/paymentController');

const router = express.Router();

router
  .route('/')
  .get(paymentController.getAll)
  .post(paymentController.create);
router
  .route('/:id')
  .get(paymentController.getOne)
  .delete(paymentController.delete);

module.exports = router;
