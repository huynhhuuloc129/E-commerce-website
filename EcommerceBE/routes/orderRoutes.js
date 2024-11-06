const express = require('express');
const orderController = require('./../controller/orderController');

const router = express.Router();

router
  .route('/')
  .get(orderController.getAll)
  .post(orderController.create);
router
  .route('/confirm/:id')
  .get(orderController.getAllConfirmedOrder)
router
  .route('/unconfirm/:id')
  .get(orderController.getAllUnConfirmedOrder)
router
  .route('/:id')
  .get(orderController.getOne)
  .patch(orderController.update)
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
router
  .route('/singledetail/:id')
  .get(orderController.getDetailsByOrderId)
router 
  .route('/ordernow/:id')
  .post(orderController.orderNow)
module.exports = router;
