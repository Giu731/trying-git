const express = require('express')
const  Cars = require('./app/controllers/Cars')
const routes = express.Router()


routes.get('/', function(req, res){
    return res.render("layout.njk")
})
routes.get('/cars/create', Cars.create)

routes.post('/cars', Cars.post)

// ATALHOS



module.exports = routes