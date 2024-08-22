const express = require('express');
const psController = require('./../controller/shoppingCartController');

const router = express.Router();

router
    .route('/')
    .get(psController.getAll)
    // .post(psController.create)
    // .patch(psController.update)
router
    .route('/:id')
    .get(psController.getOne)
    // .delete(psController.delete);

module.exports = router;
