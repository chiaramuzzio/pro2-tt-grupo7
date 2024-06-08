const db = require('../database/models');
const op = db.Sequelize.Op;
let id;

const productController = {
    index: function(req, res) {

        let id = req.params.id;
        let criterio = {
            include: [
              {association: "usuario"},
              {association: "comentarios", 
                include: [{association: 'usuario'} 
                ]}
            ]
        }

        let condition = false;

        db.Producto.findByPk(id, criterio)
        .then(function(results){

            if (req.session.user != undefined && req.session.user.id == results.usuario.id) {
                condition = true;
            }

            return res.render('product', {title:"Product", productos: results, comentarios: results.comentarios, condition: condition});
        })
        .catch(function(error){
            console.log(error);
        });
    },

    create: function(req, res) {

        let id;

        if (req.session.user != undefined || req.cookies.userId != undefined) {
            id = req.session.user.id || req.cookies.userId;
            return res.render('product-add', {title:"Add Product", id: id})
        }
        else {
            return res.redirect("/users/login");
        }
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

        let criterio = {
            include: [
              {association: "usuario"}
            ]}

        db.Producto.findByPk(form.id, criterio)
        .then(function(results){
            // return res.send(results);
            return res.render('product-edit', {title:`Editar el producto ${results.nombreProd}`, productos: results});
        })
        .catch((err) => {
            return console.log(err);
          });
        
        }
    ,

    update: function(req, res) {
        let form = req.body;

        let filtrado = {
            where: {
            id: form.id
            }
        } 

        if (req.session.user != undefined || req.cookies.userId != undefined) {
            let id = req.session.user.id || req.cookies.userId;
            if (form.idUsuario == id) {
                db.Producto.update(form, filtrado)
                .then((result) => {
                    return res.redirect("/product/id/" + form.id)
                }).catch((err) => {
                    return console.log(err);
                });
            }
            else{
                return res.redirect("/users/profile/id/" + id);
            }
        }
        else{
            return res.redirect("/users/login");
        }
    },

    destroy: function(req, res) {
        let form = req.body;
        
        let filtrado = {
          where: {
            id: form.id
          }
        }

        if (req.session.user != undefined || req.cookies.userId != undefined) {
            let id = req.session.user.id || req.cookies.userId;
            if (form.idUsuario == id) {
                db.Producto.destroy(filtrado)
                .then((result) => {
                  return res.redirect("/");
                })
                .catch((err) => {
                  return console.log(err);
                });
            }
            else{
                return res.redirect("/users/profile/id/" + id);
            }
        }
        else{
            return res.redirect("/users/login");
        }        
      }
}


module.exports = productController;