const { where } = require('sequelize');
const db = require('../database/models');

const usersController = {
    login: function(req, res, next) {
        return res.render('login', {title:"Login"});
    },
    logout: function(req, res, next) {
        req.session.destroy()
        return res.redirect("/");
    },
    register: function(req, res, next) {
        return res.render('register', {title: "Register"});
    },
    profile: function(req, res, next) {
        let usuario;
        let productos;
    
        db.Usuario.findOne()
            .then(function(results){
                usuario = results; 
                return db.Producto.findAll(); 
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