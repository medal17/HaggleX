class Queries {
  String fetchPhonePrefix() {
    return '''
      query{
        getActiveCountries(){
          callingCode,
          name,
          flag
        }
      }
    ''';
  }

  String login(username, password) {
    return r'''
       mutation Login($userna: String!, $pass: String!){ 
        login(data:{input:$userna, password:$pass}){
          token
        }}
      
      
    ''';
  }

  String signup(username, password) {
    return r'''
     mutation login(\$username: String!, \$password: String!) {
        login(
          data:{
              input: $username,
              password: $password,
              }){    
              token   
      }
   
  }
    '''
        .replaceAll('\n', '');
  }
}

// mutation createUser( $input: String!, $pass: String!) {
//         login(data:{
            
//   input: $input,
//   password: $pass,
  
//             }){
//           token
        
//       }
   
//   }


// Mutation(
//   options: MutationOptions(
//     document: gql(addStar), // this is the mutation string you just created
//     // you can update the cache based on results
//     update: (GraphQLDataProxy cache, QueryResult result) {
//       return cache;
//     },
//     // or do something with the result.data on completion
//     onCompleted: (dynamic resultData) {
//       print(resultData);
//     },
//   ),
//   builder: (
//     RunMutation runMutation,
//     QueryResult result,
//   ) {
//     return FloatingActionButton(
//       onPressed: () => runMutation({
//         'starrableId': <A_STARTABLE_REPOSITORY_ID>,
//       }),
//       tooltip: 'Star',
//       child: Icon(Icons.star),
//     );
//   },
// );