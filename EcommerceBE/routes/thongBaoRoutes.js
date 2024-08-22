const express = require('express');
const tbController = require('./../controller/thongBaoController');

const router = express.Router();

router
  .route('/')
  .get(tbController.getAll)
  // .post(tbController.createTB);
router
  .route('/:id')
  .get(tbController.getOne)
  // .delete(tbController.deleteTB);

module.exports = router;
