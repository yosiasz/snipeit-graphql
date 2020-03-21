const graphql = require('graphql');

const { getDomains} = require('../queries/queries');

//destructure
const {
    GraphQLObjectType,
    GraphQLString,
    GraphQLID,
    GraphQLList,
} = graphql;

const DomainType = new GraphQLObjectType({
    name: 'Domains',
    fields:() => ({
        DomainId: {type: GraphQLID},
        Name: {type:GraphQLString},
        BranchGuid : {type:GraphQLString},
    })
});

//project type
const ProjectType = new GraphQLObjectType({
    name: 'Projects',
    fields:() => ({
        ProjectId: {type: GraphQLID},
        Name: {type:GraphQLString},
        DomainId: {type: GraphQLID},
        domain: {
            type: DomainType,
            resolve: (parent, args) => getDomains(parent.DomainId)
        }
    })
});

module.exports = {
    DomainType: DomainType,
    ProjectType: ProjectType
};