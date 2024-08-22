const express = require('express');
const catController = require('./../controller/categoryController');

const router = express.Router();

router
  .route('/')
  .get(catController.getAll)
  // .post(hdController.createHD);
router
  .route('/:id')
  .get(catController.getOne)
  // .delete(hdController.deleteHD);

module.exports = router;
