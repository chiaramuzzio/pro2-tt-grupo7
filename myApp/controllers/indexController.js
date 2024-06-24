const db = require('../database/models');
const op = db.Sequelize.Op;

const indexController = {
    index: function (req, res) {
        let filtrado = {
            order: [["createdAt", "DESC"]],
            include: [
                { association: "comentarios" },
                { association: "usuario" }
            ]
        }

        db.Producto.findAll(filtrado)
            .then(function (results) {
                return res.render('index', { title: "Home", productos: results });
            })
            .catch(function (error) {
                console.log(error);
            });
    },

    search: function (req, res) {
        let busqueda = req.query.search;
        let filtrado = {
            where: {
                [op.or]: [
                    { nombreProd: { [op.like]: "%" + busqueda + "%" } },
                    { descripcion: { [op.like]: "%" + busqueda + "%" } }
                ]

            },
            order: [["createdAt", "DESC"]],
            include: [
                { association: "comentarios" },
                { association: "usuario" }
            ]
        }

        db.Producto.findAll(filtrado)
            .then(function (results) {
                return res.render("search-results", { title: `Resultados de la busqueda: ${busqueda}`, productos: results });
            })
            .catch(function (error) {
                console.log(error);
            });
    }
}




module.exports = indexController;