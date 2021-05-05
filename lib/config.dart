import 'package:flutter/material.dart';

//colors
const darkColor = Color(0xff2E1963);
const lightColor = Color(0xff7362A1);
const whiteColor = Colors.white;
const yellowColor = Color.fromRGBO(242, 187, 102, 1);
const CookieBrown = Color.fromRGBO(80, 50, 23, 1);
const buttonGradient = LinearGradient(
    colors: [darkColor, lightColor],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight);
const doneGradient = LinearGradient(
    colors: [yellowColor, whiteColor],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight);

//TextStyles
const h4 =
    TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w600);
const h4Dark =
    TextStyle(color: darkColor, fontSize: 15, fontWeight: FontWeight.w600);
const h2 =
    TextStyle(color: Colors.white, fontSize: 45, fontWeight: FontWeight.w800);
const h3 =
    TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.w800);
// const h3White = TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.w800);
const h5 =
    TextStyle(color: CookieBrown, fontSize: 13, fontWeight: FontWeight.w500);
const h5White =
    TextStyle(color: whiteColor, fontSize: 12, fontWeight: FontWeight.w500);
const h5Text =
    TextStyle(color: whiteColor, fontSize: 14, fontWeight: FontWeight.w500);
const h5Dark =
    TextStyle(color: CookieBrown, fontSize: 15, fontWeight: FontWeight.w800);
const h6Dark =
    TextStyle(color: CookieBrown, fontSize: 11, fontWeight: FontWeight.w400);
const h6White =
    TextStyle(color: whiteColor, fontSize: 11, fontWeight: FontWeight.w400);
const h6Green =
    TextStyle(color: Colors.green, fontSize: 9.5, fontWeight: FontWeight.w400);
const text =
    TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w300);
const textDark =
    TextStyle(color: darkColor, fontSize: 12, fontWeight: FontWeight.w300);
const errorText = TextStyle(color: Colors.red, fontSize: 16);

//List
List coins = [
  {'name': 'Haggle (HAG)', 'price': '20000', 'percent': '23.4%'},
  {'name': 'Bitcoin (BTC)', 'price': '20000', 'percent': '23.4%'},
  {'name': 'Etherum (ETH)', 'price': '20000', 'percent': '23.4%'},
  {'name': 'Tether (USDT)', 'price': '20000', 'percent': '23.4%'},
  {'name': 'Bitcoin Cash (BTH)', 'price': '20000', 'percent': '23.4%'},
  {'name': 'Dash (DASH)', 'price': '20000', 'percent': '23.4%'},
  {'name': 'DodgeCoin (DOGE)', 'price': '20000', 'percent': '23.4%'},
  {'name': 'DodgeCoin (DOGE)', 'price': '20000', 'percent': '23.4%'},
  {'name': 'LiteCoin (LTC)', 'price': '20000', 'percent': '23.4%'}
];
