const express = require('express');
const psController = require('./../controller/phieuSuaController');

const router = express.Router();

router
    .route('/')
    .get(psController.getAllPS)
    .post(psController.create)
    .patch(psController.update)
router
    .route('/:id')
    .get(psController.getOnePS)
    .delete(psController.delete);

module.exports = router;
