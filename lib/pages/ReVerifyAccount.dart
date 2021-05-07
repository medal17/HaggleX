import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:hagglex/GraphQL/GraphQLClient.dart';
import 'package:hagglex/GraphQL/Queries.dart';
import 'package:hagglex/config.dart';
import 'package:hagglex/pages/SetupComplete.dart';
import 'package:hagglex/pages/VerifyAccount.dart';
import 'package:hagglex/widgets/Button.dart';
import 'package:hagglex/widgets/TextInput.dart';

class ReVerifyAccount extends StatefulWidget {
  @override
  _ReVerifyAccountState createState() => _ReVerifyAccountState();
}

class _ReVerifyAccountState extends State<ReVerifyAccount> {

  TextEditingController email = TextEditingController();
  bool loading = false;
  String errorMessage;

  GraphQLCoonfig _graphQLCoonfig = GraphQLCoonfig();
  Queries _query = Queries();
  List response = List();

  Future verify(email) async {
    GraphQLClient _client = _graphQLCoonfig.myGraphQLClient();
    QueryResult result = await _client.query(
      QueryOptions(
          documentNode:
              gql(_query.ReVerify()),
          variables: {'mail': email.toString()},
          
    ));
    // (QueryOptions(documentNode: gql(_query.login(emailController.text.toString(), passwordController.text.toString())())));
    if (result.hasException) {
      print(result.exception);
      setState(() {
        loading = false;
        errorMessage = 'Unable to Send Verification';
      });
    } else if (!result.hasException) {
      Navigator.push(context, MaterialPageRoute(builder: (_) => VerifyAccount()));
      print(result.data
          // ['getActiveCountries'][1]['name']
          );
      setState(() {
        response = result.data;
        loading = false;
        // print(countriesCode);
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 50,
            height: 30,
            margin: EdgeInsets.only(top: 5, left: 10, bottom: 40),
            alignment: Alignment.topLeft,
            child: Center(
              child: IconButton(
                  icon: Icon(
                    Icons.arrow_back_ios_rounded,
                    size: 10,
                  ),
                  onPressed: () => Navigator.pop(context)),
            ),
            decoration: BoxDecoration(
              color: lightColor,
              borderRadius: BorderRadius.circular(50),
            ),
          ),
          Container(
              margin: EdgeInsets.only(left: 40),
              child: Text(
                'Resend Verification Code',
                style: h4,
              )),
          Center(
            child: Container(
                width: MediaQuery.of(context).size.width * 0.9,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                margin: EdgeInsets.symmetric(vertical: 15),
                decoration: BoxDecoration(
                    color: whiteColor, borderRadius: BorderRadius.circular(10)),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(0.3),
                            borderRadius: BorderRadius.circular(100)),
                        child: Icon(
                          Icons.done_outline,
                          color: darkColor,
                        ),
                      ),
                      SizedBox(height: 15),
                      Text(
                        'Input Your Email',
                        style: h5Dark,
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 30),
                      TextInput(
                        labelText: 'Email',
                        mode: 'dark',
                        hideText: false,
                        controller: email,
                      ),
                      SizedBox(height: 30),
                      GestureDetector(
                          onTap: () {
                            if(email.toString().isNotEmpty){
                              verify(email.text.toString());
                              print(email.text.toString());
                            }
                            // Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: (_) => SetupComplete()));
                          },
                          child: Button('Submit', 'gradient')),
                    ],
                  ),
                )),
          ),
        ],
      ),
    );
  }
}
  // IconButton(icon:Icon(Icons.search), onPressed(){}),


