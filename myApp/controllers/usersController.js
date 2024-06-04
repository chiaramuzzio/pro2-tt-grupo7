const db = require('../database/models');
const op = db.Sequelize.Op;
const bcrypt = require("bcryptjs")

const usersController = {
    register: function(req, res, next) {
        
        if (req.session.user != undefined) {
            return res.redirect("/users/login");
        } 
        else {
            return res.render('register', {title: "Register"})
        }
    },

    login: function(req, res, next) {
        if (req.session.user != undefined) {
            return res.redirect("/");
        } 
        else {
            return res.render('login', {title:"Login"})
        }
    },

    loginUser: function(req, res, next) {
        // console.log(req.body)
        
        let form = req.body;

        let filtro = {
            where: [
                {mail: form.email}
            ]
        };

        db.Usuario.findOne(filtro)
        .then((result) => {
            if (result != null) {
                
                let check = bcrypt.compareSync(form.password, result.contrasenia);

                if (check) {
                    req.session.user = result;
                    if (form.remember != undefined) {
                        res.cookie("userId", result.id, {maxAge: 1000 * 60 * 35})
                    }
                    return res.redirect("/users/profile");
                } 
                else {
                    return res.send("error en la password");
                }
            } 
            else {
                return res.send("No hay mail parecido a : " + form.email);
            }

        })
        .catch((err) => {
            return console.log(err);
        });
    },

    logout: function(req, res, next) {
        req.session.destroy()
        res.clearCookie("userId")
        return res.redirect("/");
    },

    store: function(req, res) {
        let form = req.body;

        let usuario = {
            mail: form.email,
            usuario: form.username,
            contrasenia: bcrypt.hashSync(form.password, 10),
            fechaNacimiento: form.birthdate,
            numeroDocumento: form.document_number,
            foto: form.profile_picture
        }

        db.Usuario.create(usuario)
        .then((result) => {
            // return res.send(result)
            return res.redirect("/")
        })
        .catch((err) => {
            return console.log(err);
        });
        },

    profile: function(req, res, next) {
        let usuario;
        let productos;
        let id

        if (req.session.user != undefined) {
            id = req.session.user.id;
        }
        else if (req.cookies.userId != undefined) {
            id = req.cookies.userId;
        }
        else {
            return res.redirect("/users/login");
        }
    
        db.Usuario.findByPk(id)
            .then(function(results){
                usuario = results; 

                let filtro = {
                    where: [
                        {clienteId: id}
                    ]
                };

                return db.Producto.findAll(filtro); 
            })
            .then(function(results){
                productos = results;
                return res.render('profile', {title:"Profile", usuario: usuario, productos: productos});
            })
            .catch(function(error){
                console.log(error);
            });
    },

    usersEdit: function(req, res, next) {
        db.Usuario.findOne()
        .then(function(results){
            return res.render('profile-edit', {title: 'Profile Edit', usuario: results});
        })
        .catch(function(error){
            console.log(error);
        });    
    }
};

module.exports = usersController;