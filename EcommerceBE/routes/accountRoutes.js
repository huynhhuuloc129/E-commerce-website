const express = require('express');
const accController = require('./../controller/accountController');

const router = express.Router();

router
  .route('/')
  .get(accController.getAll)
router
  .route('/me')
  .get(accController.getMe)
router
  .route('/login')
  .post(accController.login);
router
  .route('/register')
  .post(accController.register);
router
  .route('/:id')
  .get(accController.getOne)
  .delete(accController.delete);

module.exports = router;
