const db = require('../database/models');


const productController = {
    index: function(req, res) {
        res.render('product', {title: "Product Detail", productos: null});
    },
   
    create: function(req, res) {
        res.render('product-add', {title: "Add Product", usuario: null});
    }
}




module.exports = productController;