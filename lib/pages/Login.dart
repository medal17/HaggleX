import 'package:flutter/material.dart';
import 'package:hagglex/GraphQL/GraphQLClient.dart';
import 'package:hagglex/GraphQL/Queries.dart';
import 'package:hagglex/config.dart';
import 'package:hagglex/pages/HomeScreen.dart';
import 'package:hagglex/pages/SetupComplete.dart';
import 'package:hagglex/widgets/TextInput.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'Register.dart';

//https://hagglex-backend-staging.herokuapp.com/graphql

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  GraphQLCoonfig _graphQLCoonfig = GraphQLCoonfig();
  Queries _query = Queries();
  List response = List();

  Future login(email, password) async {
    GraphQLClient _client = _graphQLCoonfig.myGraphQLClient();
    QueryResult result = await _client.mutate(
      MutationOptions(
          documentNode:
              gql(_query.login(email.toString(), password.toString())),
          variables: {'userna': email.toString(), 'pass': password.toString()},
          onCompleted: (resultData) {
            print(resultData);
          }),
    );
    // (QueryOptions(documentNode: gql(_query.login(emailController.text.toString(), passwordController.text.toString())())));
    if (result.hasException) {
      print(result.exception);
      setState(() {
        loading = false;
        errormessage = 'Invalid Credentials';
      });
    } else if (!result.hasException) {
      Navigator.push(context, MaterialPageRoute(builder: (_) => HomeScreen()));
      print(result.data
          // ['getActiveCountries'][1]['name']
          );
      setState(() {
        response = result.data['getActiveCountries'].toList();
        loading = false;
        // print(countriesCode);
      });
    }
  }

  String errormessage;
  bool hidden = true;
  bool loading = false;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    //  initHiveForFlutter();

    //  getUser(data:GetUserInput!
    // ):User
    return Scaffold(
      backgroundColor: darkColor,
      body: Center(
        child: Container(
            width: MediaQuery.of(context).size.width * 0.8,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Welcome!',
                      style: h3,
                    )),
                errormessage != null
                    ? Text(
                        '$errormessage',
                        style: text,
                      )
                    : Text(''),
                TextInput(
                  labelText: 'Email',
                  hideText: false,
                  controller: emailController,
                ),
                TextInput(
                    labelText: 'Password',
                    hideText: hidden,
                    controller: passwordController,
                    // ignore: missing_required_param
                    icon: IconButton(
                      icon: Icon(
                        hidden
                            ? Icons.remove_red_eye_rounded
                            : Icons.visibility_off,
                        color: whiteColor,
                      ),
                      onPressed: () => {
                        setState(() {
                          hidden = !hidden;
                        })
                      },
                    )),
                SizedBox(height: 15),
                Align(
                  alignment: Alignment.topRight,
                  child: Text(
                    'Forgot Password?',
                    style: text,
                  ),
                ),
                SizedBox(height: 15),
                !loading
                    ? GestureDetector(
                        onTap: () {
                          if (emailController.text.isNotEmpty &
                              passwordController.text.isNotEmpty) {
                            login(
                                emailController.text, passwordController.text);
                            setState(() {
                              loading = true;
                            });
                          } else {
                            print('invalid Input');
                          }
                        },
                        child: Container(
                            width: MediaQuery.of(context).size.width * 0.8,
                            height: 40,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: yellowColor,
                            ),
                            child: Center(
                              child: Text(
                                'LOGIN',
                                style: h5,
                              ),
                            )),
                      )
                    : Container(
                        width: MediaQuery.of(context).size.width * 0.8,
                        height: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: yellowColor,
                        ),
                        child: Center(
                          child: Text(
                            'Loading...',
                            style: h5,
                          ),
                        )),
                SizedBox(height: 15),
                GestureDetector(
                  onTap: () => Navigator.push(
                      context, MaterialPageRoute(builder: (_) => Register())),
                  // alignment: Alignment.topRight,
                  child: Text(
                    'New User? Create an Account',
                    style: text,
                  ),
                ),

                GestureDetector(
                  onTap: () => Navigator.push(
                      context, MaterialPageRoute(builder: (_) => SetupComplete())),
                  // alignment: Alignment.topRight,
                  child: Text(
                    'By-pass to setup complete',
                    style: text,
                  ),
                ),
              ],
            )),
      ),
    );
  }
}

// Mutation create
// (insert(objects:[()])){
//   returning{
//     name
//   }
// }