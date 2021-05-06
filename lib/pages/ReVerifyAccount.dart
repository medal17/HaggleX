import 'package:flutter/material.dart';
import 'package:hagglex/config.dart';
import 'package:hagglex/pages/SetupComplete.dart';
import 'package:hagglex/widgets/Button.dart';
import 'package:hagglex/widgets/TextInput.dart';

class ReVerifyAccount extends StatefulWidget {
  @override
  _ReVerifyAccountState createState() => _ReVerifyAccountState();
}

class _ReVerifyAccountState extends State<ReVerifyAccount> {
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
                      ),
                      SizedBox(height: 30),
                      GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => SetupComplete()));
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


