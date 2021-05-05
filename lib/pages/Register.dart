import 'package:flutter/material.dart';
import 'package:hagglex/GraphQL/GraphQLClient.dart';
import 'package:hagglex/GraphQL/Queries.dart';
// import 'package:hagglex/GraphQL/Queries.dart';
import 'package:hagglex/config.dart';
import 'package:hagglex/pages/VerifyAccount.dart';
import 'package:hagglex/widgets/Button.dart';
import 'package:hagglex/widgets/TextInput.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  GraphQLCoonfig _graphQLCoonfig = GraphQLCoonfig();
  Queries _query = Queries();
  List countriesCode = List();

  @override
  void initState() {
    super.initState();
    fetchPrefix();
  }

  Future fetchPrefix() async {
    GraphQLClient _client = _graphQLCoonfig.myGraphQLClient();
    QueryResult result = await _client
        .query(QueryOptions(documentNode: gql(_query.fetchPhonePrefix())));
    if (result.hasException) {
      print(result.exception);
    } else if (!result.hasException) {
      print(result.data['getActiveCountries'][1]['name']);
      setState(() {
        countriesCode = result.data['getActiveCountries'].toList();
        // print(countriesCode);
      });
    }
  }

  bool hidden = true;
  List<String> countries = ['Nigeria', 'Ghana', 'Egypt'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkColor,
      body: Align(
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 50,
                height: 30,
                margin: EdgeInsets.only(top: 25, left: 10, bottom: 20),
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
              Center(
                child: Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                    margin: EdgeInsets.symmetric(vertical: 15),
                    decoration: BoxDecoration(
                        color: whiteColor,
                        borderRadius: BorderRadius.circular(10)),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                              alignment: Alignment.topLeft,
                              child: Text(
                                'Create an Account',
                                style: h5Dark,
                              )),
                          TextInput(
                            labelText: 'Email',
                            hideText: false,
                            mode: 'dark',
                          ),
                          TextInput(
                              labelText: 'Password',
                              mode: 'dark',
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
                          // SizedBox(height:20),

                          //Username input
                          TextInput(
                            labelText: 'Create Username',
                            hideText: false,
                            mode: 'dark',
                          ),

                          Row(
                            children: [
                              Expanded(
                                  child: GestureDetector(
                                onTap: () => showSearch(
                                    context: context,
                                    delegate: Search(countries)),
                                child: Container(
                                  margin: EdgeInsets.only(top: 18, right: 8),
                                  height: 40,
                                  child: Row(
                                    children: [
                                      Icon(Icons.flag,
                                          color: Colors.greenAccent),
                                      Text(
                                        '(+234)',
                                        style: textDark,
                                      )
                                    ],
                                  ),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(3),
                                      color: Colors.grey.withOpacity(0.17)),
                                ),
                              )),
                              Expanded(
                                flex: 2,
                                child: TextInput(
                                  labelText: 'Phone Number',
                                  hideText: false,
                                  mode: 'dark',
                                ),
                              ),
                            ],
                          ),

                          TextInput(
                            labelText: 'Referral Link',
                            hideText: false,
                            mode: 'dark',
                          ),

                          // SizedBox(height:20),

                          SizedBox(height: 15),
                          Text(
                            'By signing you agree to HaggleX terms and privacy Policy',
                            style: h6Dark,
                          ),
                          SizedBox(height: 10),

                          GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) => VerifyAccount()));
                              },
                              child: Container(
                                  child: Button('SIGN UP', 'gradient'))),
                        ],
                      ),
                    )),
              ),
            ],
          ),
        ),
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
                    // showResults(context);
                  },
                )
              : Center(child: Text('No gig found'));
        },
      ),
    );
  }
}
  // IconButton(icon:Icon(Icons.search), onPressed(){}),


