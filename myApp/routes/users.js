var express = require('express');
var router = express.Router();
const usersController = require("../controllers/usersController");
const { body } = require('express-validator');

let validations = [
    body('email')
        .notEmpty().withMessage('El campo Mail es obligatorio.').bail()
        .isEmail().withMessage('Debe ser un email valido')
        .custom(function(value, {req}){
            return db.User.findOne({
                where: { email: req.body.email },
              })
                  .then(function(user){
                     if(user){ //ARREGLAR ESTO --> FALTA ACA
       }
                  })
       }),
    body('username')
    .notEmpty().withMessage('Por favor, introduzca un nombre de usuario').bail,

    body('password')
        .notEmpty().withMessage('El campo Contraseña es obligatorio.')
        .isLength({ min: 4 }).withMessage('La contraseña debe tener más de 4 caracteres').bail()
   
]

router.get('/login', usersController.login);
router.post('/login', validations, usersController.loginUser);

router.get('/register', usersController.register);
router.post('/register', validations, usersController.store);

router.get('/profile/id/:id', usersController.profile);

router.get('/edit', usersController.usersEdit);

router.post('/logout', usersController.logout);

module.exports = router;
