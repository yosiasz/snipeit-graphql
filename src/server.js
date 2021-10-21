const express = require('express');
const graphqlHTTP = require('express-graphql');
const schema = require('./schema/schema.js');
const https = require('https');
const fs = require('fs');

const app = express();

app.use('/graphql', graphqlHTTP({
    schema:schema,
    graphiql:true
}));

function verifyToken(req, res, next) {
    const bearerHeader = req.headers['authorization'];
  
    if (bearerHeader) {
      const bearer = bearerHeader.split(' ');
      const bearerToken = bearer[1];
      req.token = bearerToken;
      next();
    } else {
      // Forbidden
      res.sendStatus(403);
    }
  }

const options = {
    key: fs.readFileSync('./src/certs/key.pem'),
    cert: fs.readFileSync('./src/certs/cert.pem')
  };


 var server = https.createServer(options, app).listen(4100, () => {
    console.log('snipeit-graphql is running on port http://localhost:4100/graphql');
});