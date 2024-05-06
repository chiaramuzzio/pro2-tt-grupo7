const db = require('../database/models');


const usersController = {
    login: function(req, res, next) {

        db.Usuario.findAll()
        .then(function(results){
            return res.send(results)
            return res.render('login',{title:"Login", })
        })
        .catch(function(error){
            console.log(error);
        })
        // res.render('login', {title: "Login"});
    },


    register: function(req, res, next) {
        res.render('register', {title: "Register"});
    },


    profile: function(req, res, next) {
        res.render('profile', {title: 'Profile', usuario: null, productos: null});
    },


    usersEdit: function(req, res, next) {
        res.render('profile-edit', {title: 'Profile Edit', usuario: null});
    }
}




module.exports = usersController;