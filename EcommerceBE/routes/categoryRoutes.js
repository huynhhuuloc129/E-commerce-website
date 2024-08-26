const express = require('express');
const catController = require('./../controller/categoryController');

const router = express.Router();

router
  .route('/')
  .get(catController.getAll)
  .post(catController.create);
router
  .route('/:id')
  .get(catController.getOne)
  .delete(catController.delete);

module.exports = router;
