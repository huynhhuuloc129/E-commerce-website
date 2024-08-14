const express = require('express');
const hdController = require('./../controller/hoatDongController');

const router = express.Router();

router
  .route('/')
  .get(hdController.getAllHD)
  // .post(hdController.createHD);
router
  .route('/:id')
  .get(hdController.getOneHD)
  // .delete(hdController.deleteHD);

module.exports = router;
