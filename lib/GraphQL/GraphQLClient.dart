import 'package:flutter/cupertino.dart';

import 'package:graphql_flutter/graphql_flutter.dart';

class  GraphQLCoonfig {
  static HttpLink httpLink = HttpLink(
    uri: "https://hagglex-backend-staging.herokuapp.com/graphql"
     );

     GraphQLClient myGraphQLClient(){
       return GraphQLClient(
         link: httpLink,
         cache: InMemoryCache(),
         );
     }
}