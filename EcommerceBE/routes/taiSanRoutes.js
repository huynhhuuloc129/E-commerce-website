const express = require('express');
const tsController = require('./../controller/taiSanController');

const router = express.Router();

router
  .route('/')
  .get(tsController.getAll)
  .post(tsController.create)
  .patch(tsController.update);
router
  .route('/:id')
  .get(tsController.getOne)
  .delete(tsController.delete);

module.exports = router;
