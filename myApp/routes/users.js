var express = require('express');
var router = express.Router();
const usersController = require("../controllers/usersController");
const { body } = require('express-validator');
const db = require('../database/models');


let validationsLogin = [
    body('email')
        .notEmpty().withMessage('El campo Mail es obligatorio.').bail()
        .isEmail().withMessage('Debe ser un email valido').bail()
        .custom(function(value, {req}){
            return db.Usuario.findOne({
                where: { mail: req.body.email },
              })
                  .then(function(user){
                    if(user != undefined){ 
                        return true;
                    }
                    else{
                        throw new Error ('El email no existe')
                    }
                  })
       })
    ,
    body('password')
        .notEmpty().withMessage('El campo Contraseña es obligatorio.').bail()
]

let validationsRegister = [
    body('email')
    .notEmpty().withMessage('El campo Mail es obligatorio.').bail()
    .isEmail().withMessage('Debe ser un email valido'),
    
    body('username')
    .notEmpty().withMessage('Por favor, introduzca un nombre de usuario'),
    
    body('password')
    .notEmpty().withMessage('El campo Contraseña es obligatorio.').bail()
    .isLength({ min: 4 }).withMessage('La contraseña debe tener más de 4 caracteres')
]

router.get('/login', usersController.login);
router.post('/login', validationsLogin, usersController.loginUser);

router.get('/register', usersController.register);
router.post('/register', validationsRegister, usersController.store);

router.get('/profile/id/:id', usersController.profile);

router.get('/edit', usersController.usersEdit);

router.post('/logout', usersController.logout);

module.exports = router;
