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
router
  .route('/account/:id')
  .get(orderController.getAllByAccountIdAndShipped)
router
  .route('/detail/:id')
  .get(orderController.getDetailsByAccountId)
router
  .route('/all/detail')
  .get(orderController.getAllDetailsByAccountId)
module.exports = router;
