const mysql = require('mysql2/promise');
const config = require('../config/config');

async function getAssets () {
    try {

        const connection = await mysql.createConnection(config.snipeit);
        const [results, ] = await connection.execute('select id, name, asset_tag from assets LIMIT 2');
        
        assets = results

        return assets
    } catch (err) {
        console.dir(err);
    }    
}

module.exports = {
    getAssets : getAssets
}