import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:hagglex/GraphQL/GraphQLClient.dart';
import 'package:hagglex/GraphQL/Queries.dart';
import 'package:hagglex/config.dart';
import 'package:hagglex/pages/HomeScreen.dart';
import 'package:hagglex/pages/ReVerifyAccount.dart';
import 'package:hagglex/pages/SetupComplete.dart';
import 'package:hagglex/widgets/Button.dart';
import 'package:hagglex/widgets/TextInput.dart';

class VerifyAccount extends StatefulWidget {
  @override
  _VerifyAccountState createState() => _VerifyAccountState();
}

class _VerifyAccountState extends State<VerifyAccount> {

  String errormessage;
  bool loading = false;
  TextEditingController code = TextEditingController();

   GraphQLCoonfig _graphQLCoonfig = GraphQLCoonfig();
  Queries _query = Queries();
  List response = List();

  Future verify(code) async {
    GraphQLClient _client = _graphQLCoonfig.myGraphQLClient();
    QueryResult result = await _client.mutate(
      MutationOptions(
          documentNode:
              gql(_query.verify()),
          variables: {'code': int.parse(code.text.toString())},
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
                'Verify Your Account',
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
                        'We just sent a verification code to your email please enter the code',
                        style: h5Dark,
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 30),
                      TextInput(
                        labelText: 'Verification code',
                        mode: 'dark',
                        controller: code,
                        hideText: false,
                        keyboardType: TextInputType.number,
                      ),
                      SizedBox(height: 30),
                      GestureDetector(
                          onTap: () {
                           if(code.text.toString().isNotEmpty){
                             verify(code);
                             print(code.text);
                           }
                          },
                          child: Button('VERIFY ME', 'gradient')),
                      SizedBox(height: 15),
                      Text(
                        'The code will expire in ${10}',
                        style: h6Dark,
                      ),
                      SizedBox(height: 10),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => ReVerifyAccount()));
                        },
                        child: Text(
                          'Resend Code',
                          style: h5Dark,
                        ),
                      ),
                    ],
                  ),
                )),
          ),
        ],
      ),
    );
  }
}

class Search extends SearchDelegate {
  List<String> countries;

  @override
  List<Widget> buildActions(BuildContext context) {
    return <Widget>[
      IconButton(
          icon: Icon(Icons.close),
          onPressed: () {
            query = "";
          })
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        icon: Icon(Icons.arrow_back_ios),
        onPressed: () {
          Navigator.pop(context);
        });
  }

  String selectedResult;
  @override
  Widget buildResults(BuildContext context) {
    return Container(
      color: darkColor,
      child: Center(child: Text(selectedResult != null ? selectedResult : '')),
    );
  }

  final List<String> listExample;
  Search(this.listExample);

  List<String> recentList = ['text 4', 'Text'];

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> suggestiontList = [];

    // print(_fetchData(context).length
    query.isEmpty
        ? suggestiontList = listExample
        : suggestiontList.addAll(listExample);
    //  print(suggestiontList);
    return Container(
      color: darkColor,
      child: ListView.builder(
        itemCount: listExample.length,
        itemBuilder: (context, index) {
          return suggestiontList.length > 0
              ? ListTile(
                  title: Text(
                    suggestiontList[index].length > 0
                        ? suggestiontList[index]
                        : 'nothing',
                    style: text,
                  ),
                  onTap: () {
                    selectedResult = suggestiontList[index];
                    showResults(context);
                  },
                )
              : Center(child: Text('No gig found'));
        },
      ),
    );
  }
}
  // IconButton(icon:Icon(Icons.search), onPressed(){}),


