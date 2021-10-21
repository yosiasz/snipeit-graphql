const graphql = require('graphql');
const { getAssets } = require('../queries/queries');
const { AssetType } = require('../types/types');

let assets = [];

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
        assets:{
            type: GraphQLList(AssetType),
            resolve(parentValue, args){
                assets = getAssets();
                return assets;
            }
        }                  
    }

});

module.exports = new  GraphQLSchema({
    query: RootQuery
});