const express = require('express');
const pbController = require('./../controller/phongBanController');

const router = express.Router();

router
  .route('/')
  .get(pbController.getAllPB)
  .post(pbController.create);
router
  .route('/:id')
  .get(pbController.getOnePB)
  .delete(pbController.delete);

module.exports = router;
