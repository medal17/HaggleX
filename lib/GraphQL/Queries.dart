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

  String ReVerify() {
    return r'''
       query resendVerificationCode($mail: String!){ 
        resendVerificationCode(data:{email:$mail})}
      
      
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

  String signup() {
    return r'''
     mutation Register($username: String!, $password: String!, $email: String!, $phone: String!, $ref: String!,
     $country: String!, $currency:String!, $code:String!, $flag:String!) {
        register(
          data:{
              username: $username,
              password: $password,
              email: $email,
              phonenumber: $phone,
              referralCode: $ref,
              phoneNumberDetails: data:{
                    phoneNumber: $phone,
                    callingCode: $code,
                    flag: $flag
              }
              country: $country,
              currency: $currency
}
              }){    
              token   
      }
   
  }
    ''';
  }

String verify() {
    return r'''
       mutation verifyUser($code: Int!){ 
        verifyUser(data:{code:$code}){
          token
        }}
      
      
    ''';
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