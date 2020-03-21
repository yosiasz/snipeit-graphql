const graphql = require('graphql');
const {getDomainById, getDomains, getProjects} = require('../queries/queries');
const {DomainType, ProjectType} = require('../types/types');

let projects = [];
let domains = [];

const {
    GraphQLObjectType,
    GraphQLString,
    GraphQLInt,
    GraphQLSchema,
    GraphQLList,
    GraphQLID,
    GraphQLNonNull
} = graphql;


//root query
const RootQuery = new GraphQLObjectType({
    name: 'RootQueryType',
    fields:{
        projects:{
            type: GraphQLList(ProjectType),
            args:{
                projectid:{type:GraphQLInt}
             },            
            resolve(parentValue, args){
                projects = getProjects(args.projectid);   
                return projects; 
            }
        },
        domains:{
            type: GraphQLList(DomainType),
            resolve(parentValue, args){
                domains = getDomains(args.domainId);  
                return domains;
            }
        }           
    }

});

module.exports = new  GraphQLSchema({
    query: RootQuery
});