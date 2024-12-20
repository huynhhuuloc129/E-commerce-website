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
  .route('/password')
  .patch(accController.changePassword);
router
  .route('/google')
  .post(accController.loginGoogle);
router
  .route('/register')
  .post(accController.register);
router
  .route('/:id')
  .get(accController.getOne)
  .patch(accController.update)
  .delete(accController.delete);
router
  .route('/avatar/:id')
  .patch(accController.updateAvatar)

module.exports = router;
