const db = require('../database/models');
const op = db.Sequelize.Op;

const indexController = {
    index: function(req, res) {
        let filtrado = {
            order: [["nombreProd", "ASC"]],
            include: [
                {association: "comentarios"}
              ]
        }

        db.Producto.findAll(filtrado)
        .then(function(results){
            // return res.send(results)
            return res.render('index', {title: "Home", productos: results});
        })
        .catch(function(error){
            console.log(error);
        });
    },
   
    search: function(req, res) {

        let busqueda = req.query.search;

        let filtrado = {
            where: {
                nombreProd: { [op.like]: "%" + busqueda + "%"}
            }
        }

        db.Producto.findAll(filtrado)
        .then(function(results){
            return res.render('search-results', {title: "Search Results", productos: results, usuario: req.session.user});
        })
        .catch(function(error){
            console.log(error);
        });
    }
}




module.exports = indexController;