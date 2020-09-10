const AgencyOption = require('../models/AgencyOption')
const Car = require('../models/Car')

module.exports = {
    create(req, res){
        AgencyOption.all()
        .then(function(results){
            const agencyOptions = results.rows
            return res.render("cars/create.njk", {agencyOptions})
        }).catch(function(err){
            throw new Error(err)
        })
    },
    async post(req, res){
        const keys = Object.keys(req.body)
        for(key of keys){
            if(req.body[key]==""){
                return res.send("Por favor, preencha todos os campos.")
            }
        }

        let results = await Car.create(req.body)
        const carId = results.rows[0].id

        results = await AgencyOption.all()
        const agencyOptions = results.rows

        return res.render("cars/create.njk", {carId, agencyOptions})
    }
}