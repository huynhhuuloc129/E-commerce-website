const express = require('express');
const shoppingCartController = require('./../controller/shoppingCartController');

const router = express.Router();

router
    .route('/')
    .get(shoppingCartController.getAll)
    .post(shoppingCartController.create)
    // .patch(psController.update)
router
    .route('/:id')
    .get(shoppingCartController.getOne)
    .delete(shoppingCartController.delete);

module.exports = router;
