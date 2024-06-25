var express = require('express');
var router = express.Router();
const indexController = require("../controllers/indexController");

//RUTAS
router.get('/', indexController.index);

router.get('/search-results', indexController.search);

module.exports = router;