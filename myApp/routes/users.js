var express = require('express');
var router = express.Router();
const usersController = require("../controllers/usersController");
const { body } = require('express-validator');

let validations = [
    body('email')
        .notEmpty().withMessage('El campo Mail es obligatorio.').bail()
        .isEmail().withMessage('Debe ser un email valido'),
    body('password')
        .notEmpty().withMessage('El campo Contraseña es obligatorio.'),
    body('remember')
]

router.get('/login', usersController.login);
router.post('/login', validations, usersController.loginUser);

router.get('/register', usersController.register);
router.post('/register', usersController.store);

router.get('/profile/id/:id', usersController.profile);

router.get('/edit', usersController.usersEdit);

router.post('/logout', usersController.logout);

module.exports = router;
