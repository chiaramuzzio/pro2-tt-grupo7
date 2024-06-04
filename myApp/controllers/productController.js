const db = require('../database/models');
const op = db.Sequelize.Op;
let id;

const productController = {
    index: function(req, res) {

        let id = req.params.id;

        let comentarios;
        let productos;

        db.Producto.findByPk(id)
        .then(function(results){
            productos = results;
            return db.Comentario.findAll({
                limit: 5,
            });
        })
        .then(function(results){
            comentarios = results;
            return res.render('product', {title:"Product", productos: productos, comentarios: comentarios});
        })
        .catch(function(error){
            console.log(error);
        });
    },

    create: function(req, res) {

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
                return res.render('product-add', {title:"Add Product", usuario: results});
            })
            .catch(function(error){
                console.log(error);
            });
    },

    store: function(req, res) {
        let form = req.body;
        db.Producto.create(form)
        .then((result) => {
            return res.redirect("/product/id/" + result.id)
        }).catch((err) => {
          return console.log(err);
        });
    },

    formUpdate: function(req, res) {
        let form = req.body;
        
        db.Producto.findByPk(form.id)
        .then(function(results){
            // return res.send(results);
            return res.render('product-edit', {title:"Product Edit", productos: results});
        })
        .catch((err) => {
            return console.log(err);
          });
    },

    update: function(req, res) {
        let form = req.body;
        let filtrado = {
            where: {
            id: form.id
            }
        } 

        db.Producto.update(form, filtrado)
        .then((result) => {
            return res.redirect("/product/id/" + form.id)
        }).catch((err) => {
            return console.log(err);
        });
    },

    destroy: function(req, res) {
        let form = req.body;
        
        let filtrado = {
          where: {
            id: form.id
          }
        }
  
        db.Movie.destroy(filtrado)
        .then((result) => {
          return res.redirect("/movies/");
        }).catch((err) => {
          return console.log(err);
        });
        
      }
}


module.exports = productController;