const express = require('express');
const ndController = require('./../controller/nguoiDungController');

const router = express.Router();

router
  .route('/me')
  .get(ndController.getMe)
router
  .route('/')
  .get(ndController.getAllND)
router
  .route('/login')
  .post(ndController.login);
router
  .route('/register')
  .post(ndController.register);
router
  .route('/password')
  .post(ndController.changePassword);
router
  .route('/:id')
  .get(ndController.getOneND)
  .patch(ndController.update)

module.exports = router;
