const express = require('express');
const phController = require('./../controller/phanHoiController');

const router = express.Router();

router
  .route('/')
  .get(phController.getAllPH)
  // .post(phController.createPH);
router
  .route('/:id')
  .get(phController.getOnePH)
  // .delete(phController.deletePH);

module.exports = router;
