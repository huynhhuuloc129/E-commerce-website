const express = require('express');
const tbController = require('./../controller/thongBaoController');

const router = express.Router();

router
  .route('/')
  .get(tbController.getAllTB)
  // .post(tbController.createTB);
router
  .route('/:id')
  .get(tbController.getOneTB)
  // .delete(tbController.deleteTB);

module.exports = router;
