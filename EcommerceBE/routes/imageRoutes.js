const express = require('express');
const imageController = require('./../controller/imageController');

const router = express.Router();

router
  .route('/')
  .get(imageController.getAll)
  .post(imageController.create)
router
  .route('/:id')
  .get(imageController.getOne)
  .delete(imageController.delete)
router
  .route('/belong/:id')
  .get(imageController.getAllByBelongId)
  .delete(imageController.deleteByBelongId)
module.exports = router;
