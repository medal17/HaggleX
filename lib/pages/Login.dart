import 'package:flutter/material.dart';
import 'package:hagglex/config.dart';
import 'package:hagglex/widgets/TextInput.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'Register.dart';

//https://hagglex-backend-staging.herokuapp.com/graphql

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool hidden = true;

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
                TextInput(
                  labelText: 'Email',
                  hideText: false,
                ),
                TextInput(
                    labelText: 'Password',
                    hideText: hidden,
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
                Container(
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