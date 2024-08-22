const express = require('express');
const pbController = require('./../controller/phongBanController');

const router = express.Router();

router
  .route('/')
  .get(pbController.getAll)
  .post(pbController.create);
router
  .route('/:id')
  .get(pbController.getOne)
  .delete(pbController.delete);

module.exports = router;
