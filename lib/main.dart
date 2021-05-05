import 'dart:async';

import 'package:flutter/material.dart';
import 'config.dart';
import 'pages/Login.dart';

void main() {
  runApp(
    // Future.delayed(Duration(seconds: 10), home());
    MyApp()
    );
}
//#2E1963
//#7362A1


class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'HaggleX',
     
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);


  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  

  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 2), ()=>Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_)=>Login())));
    return Scaffold(
      backgroundColor: darkColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'assets/images/Asset 24@4x.png',
              
            ),
            SizedBox(height:20),
            Text(
              'HaggleX',
              
              style: h4,
            ),
          ],
        ),
      ),// This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

//distributionUrl=https\://services.gradle.org/distributions/gradle-6.7-all.zip