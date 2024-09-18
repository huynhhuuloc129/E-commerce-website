const express = require('express');
const shipmentController = require('./../controller/shipmentController');

const router = express.Router();

router
  .route('/')
  .get(shipmentController.getAll)
  .post(shipmentController.create);
router
  .route('/:id')
  .get(shipmentController.getOne)
  .delete(shipmentController.delete);

module.exports = router;
