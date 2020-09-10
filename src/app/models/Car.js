const db = require('../../config/db')

module.exports = {
    create(data){
        const query = `
        INSERT INTO cars(
            agency_id,
            model_id
        ) VALUES ($1)
        RETURNING id
        `
        const values = [
            data.name,
            data.id
        ]

        return db.query(query, values)

    }
}