const db = require('../database/models');
const op = db.Sequelize.Op;
const bcrypt = require("bcryptjs");
const { validationResult } = require('express-validator');
const { update } = require('./productController');

const usersController = {

    profile: function(req, res, next) {
        let id = req.params.id;

        let criterio = {
            include: [
                {association: "productos"},
                {association: "comentarios"}
            ],
            order: [[{model: db.Producto, as: 'productos'}, 'createdAt', 'DESC']]
        }
    
        db.Usuario.findByPk(id, criterio)
            .then(function(results){

                let condition = false;

                if (req.session.user != undefined && req.session.user.id == results.id) {
                    condition = true;
                }

                return res.render('profile', {title: `@${results.usuario}`, usuario: results, productos: results.productos, comentarios: results.comentarios.length, condition: condition});
            })
            .catch(function(error){
                console.log(error);
            });
    },

    register: function(req, res, next) {
        
     
        if (req.session.user != undefined) {
            return res.redirect("/users/profile/id/" + req.session.user.id); //no deberia reditigir a la home o al perfil?
        } 
        else {
            return res.render('register', {title: "Register"})
        };
    },


    store: function(req, res) {

        let form = req.body;
        let errors = validationResult(req);

        if (errors.isEmpty()) {

            db.Usuario.findOne({ where: 
                { mail: form.email } })
                .then(user => {
                    if (user) {
                        return res.render('register', {
                            title: "Register",
                            errors:  { email: { msg: 'El correo electrónico ya está registrado.' } },
                            old: req.body
                        });
                    }})

            let usuario = {
                mail: form.email,
                usuario: form.username,
                contrasenia: bcrypt.hashSync(form.password, 10),
                fechaNacimiento: form.birthdate,
                numeroDocumento: form.document_number,
                foto: form.profile_picture || "/images/users/default.png"
            }
    
            db.Usuario.create(usuario)
            .then((result) => {
                return res.redirect("/users/login")
            })
            .catch((err) => {
                return console.log(err);
            });       
        } 
        else {
            return res.render('Register', {title: "Register", errors: errors.mapped(), old: req.body });        
        }

    },

    login: function(req, res, next) {
        if (req.session.user != undefined) {
            return res.redirect("/users/profile/id/" + result.id);
        } 
        else {
            return res.render('login', {title:"Login"})
        }
    },

    loginUser: function(req, res, next) {
        // console.log(req.body)

        let form = req.body;
        let errors = validationResult(req);

        if (errors.isEmpty()) {
            
            let filtro = {
                where: [
                {mail: form.email}
                ]
            }

            db.Usuario.findOne(filtro)
            .then((result) => {
                if (result != null) {
                    
                    req.session.user = result;
                    if (form.remember != undefined) {
                        res.cookie("userId", result.id, {maxAge: 1000 * 60 * 35})
                    }
                    return res.redirect("/users/profile/id/" + result.id);
                } 
                else {
                    return res.redirect("/users/login");
                }
    
            })
            .catch((err) => {
                return console.log(err);
            });
        }
        else{
            res.render('login', {title: "Login", errors: errors.mapped(),  old: req.body, user: req.session.user});
        }
    },

    logout: function(req, res, next) {
        req.session.destroy()
        res.clearCookie("userId")
        return res.redirect("/");
    },

    usersEdit: function(req, res, next) {
        
        if (req.session.user != undefined) {
            let id = req.session.user.id;

            db.Usuario.findByPk(id)
            .then(function(results){
                return res.render('profile-edit', {title: 'Profile Edit', usuario: results});
            })
            .catch(function(error){
                console.log(error);
            });    
        }
        else {
            return res.redirect("/users/login");
        }

    },

    update: function(req, res) {
        let errors = validationResult(req);

        if (errors.isEmpty()) {
            return res.send("ACA HAY QUE HACER TODO EL UPDATE DE USUARIO (controller Users en el metodo .update si errors.isEmpty) (borrar el res send y hacer todo el desarrollo)")
        }
        else {
            return res.render('profile-edit', {title: "Profile Edit", errors: errors.mapped(), old: req.body }); 
        }
        
    }
};

module.exports = usersController;