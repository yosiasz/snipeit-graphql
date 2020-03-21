const graphql = require('graphql');
const sql = require('mssql');


const config = require('../server/config.js');

async function getDomainById (domainId){
    try {

        let pool = await sql.connect(config.sqldb)
        let result = await pool.request()
        .input('domainId', sql.Int, domainId)                            
        .execute('dbo.domains_sp')
        
        sql.close();
        pool.close();
        
        domains = result.recordsets[0]

    } catch (err) {
        console.dir(err);
        sql.close();
    }    
                
    return domains[0]; 
}

async function getDomains (domainId) {
    try {
        let pool = await sql.connect(config.sqldb)
        let result = await pool.request()
        .input('domainId', sql.Int, domainId)                            
        .execute('dbo.domains_sp')

        domains = result.recordsets[0]

    } catch (err) {
        console.dir(err);
        sql.close();
    }

    if (domainId) {
        return domains[0];
    }
    else {
        return domains;
    }
    
}

async function getProjects (productid) {
    try {
        let pool = await sql.connect(config.sqldb)
        let result = await pool.request()
        .input('projectid', sql.Int, productid)                            
        .execute('projects_sp')
        
        projects = result.recordsets[0]

    } catch (err) {
        console.dir(err);
        sql.close();
        pool.close();
        // ... error checks
    }
    return projects;  
};

module.exports = {

    getProjects : getProjects,
    getDomainById :  getDomainById,
    getDomains : getDomains,

}