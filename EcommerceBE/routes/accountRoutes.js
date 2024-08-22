const express = require('express');
const accController = require('./../controller/accountController');

const router = express.Router();

router
  .route('/')
  .get(accController.getAll)
  .post(accController.create);
router
  .route('/:id')
  .get(accController.getOne)
// .delete(chtsController.deleteCHTS);

module.exports = router;
