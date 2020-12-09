const express = require('express');
const graphqlHTTP = require('express-graphql');
const schema = require('./src/schema/schema.js');

const app = express();
const projects = [];
const domains = [];

app.use('/graphql', graphqlHTTP({
    schema:schema,
    rootValue: projects,
    context: projects,
    graphiql:true
}));

app.use('/domain-service/graph', graphqlHTTP({
    schema:schema,
    rootValue: domains,
    context: domains,
    graphiql:true
}));

app.listen(4200, () => {
    console.log('ba-graphql is running on port http://localhost:4200/graphql');
});