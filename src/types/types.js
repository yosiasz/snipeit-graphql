const graphql = require('graphql');

//destructure
const {
    GraphQLObjectType,
    GraphQLString,
    GraphQLID,
    GraphQLList,
} = graphql;

const AssetType = new GraphQLObjectType({
    name: 'Assets',
    fields:() => ({
        id: {type: GraphQLID},
        name: {type:GraphQLString},
        asset_tag: {type:GraphQLString},
    })
});

module.exports = {
    AssetType: AssetType
};