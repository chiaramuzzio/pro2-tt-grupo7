const db = require('../database/models');


const indexController = {
    index: function(req, res) {
        res.render('index', {title: "Home", productos: null});
    },
   
    search: function(req, res) {
        res.render('search-results', {title: "Search Results", productos: null});
    }
}




module.exports = indexController;