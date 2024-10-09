const express = require('express');
const reviewController = require('./../controller/reviewController');

const router = express.Router();

router
  .route('/')
  .get(reviewController.getAll)
  .post(reviewController.create);
router
  .route('/:id')
  .get(reviewController.getOne)
  .patch(reviewController.update)
  .delete(reviewController.delete);
router
  .route('/product/:id')
  .get(reviewController.getAllByProductId);
router
  .route('/product/:productId/account/:accountId')
  .get(reviewController.getAllByProductIdAndAccountId);
module.exports = router;
