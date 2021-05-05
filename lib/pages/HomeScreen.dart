import 'package:flutter/material.dart';
import 'package:hagglex/config.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isToggle = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text(
          'HaggleX',
          style: h4,
        )),
        // toolbarHeight: MediaQuery.of(context).size.height*.3,
        leading: Container(
          padding: EdgeInsets.all(3),
          margin: EdgeInsets.only(left: 10, top: 10, right: 10, bottom: 10),
          width: 50,
          height: 30,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              border: Border.all(color: whiteColor, width: 1.2)),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: whiteColor,
            ),
            child: Center(
              child: Text(
                'SV',
                style: h4Dark,
              ),
            ),
          ),
        ),
        backgroundColor: darkColor,
        elevation: 0,
        actions: [
          Stack(children: [
            Container(
                margin: EdgeInsets.only(right: 10, top: 10),
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    // border: Border.all(color: whiteColor, width: 2),
                    color: lightColor.withOpacity(0.3)),
                child: Center(
                  child: Icon(
                    Icons.notifications,
                    size: 14,
                  ),
                )),
            Positioned(
              top: -1,
              right: 0,
              child: Container(
                  margin: EdgeInsets.only(right: 10, top: 10),
                  width: 13,
                  height: 13,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      // border: Border.all(color: whiteColor, width: 2),
                      color: Colors.red),
                  child: Center(
                    // child: Icon(Icons.notifications),
                    child: Text(
                      '5',
                      style: h6White,
                    ),
                  )),
            ),
          ]),
        ],
      ),
      body: Column(children: [
        Container(
          height: MediaQuery.of(context).size.height * .15,
          color: darkColor,
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Align(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Total Portfolio balance', style: h6White),
                  AnimatedContainer(
                      alignment: Alignment.topLeft,
                      duration: Duration(milliseconds: 700),
                      child:
                          Text(isToggle ? 'N3,000' : '\$ ****', style: h5Text)),
                ],
              )),
              GestureDetector(
                onTap: () {
                  setState(() {
                    isToggle = !isToggle;
                  });
                },
                child: AnimatedContainer(
                    duration: Duration(seconds: 2),
                    // alignment: isToggle?Alignment.centerRight:Alignment.centerLeft,
                    height: 26,
                    width: 70,
                    padding: EdgeInsets.symmetric(horizontal: 2),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: whiteColor,
                    ),
                    child: Stack(
                      // mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        AnimatedAlign(
                            duration: Duration(milliseconds: 300),
                            alignment: isToggle
                                ? Alignment.centerLeft
                                : Alignment.centerRight,
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 3),
                              child:
                                  Text(isToggle ? 'USD' : 'NGN', style: h6Dark),
                            )),
                        AnimatedAlign(
                          duration: Duration(milliseconds: 400),
                          alignment: isToggle
                              ? Alignment.centerRight
                              : Alignment.centerLeft,
                          child: Container(
                            alignment: Alignment.center,
                            height: 20,
                            width: 35,
                            decoration: BoxDecoration(
                              border: Border.all(width: 1, color: whiteColor),
                              borderRadius: BorderRadius.circular(50),
                              color: yellowColor,
                            ),
                            child: Text(
                              isToggle ? 'NGN' : 'USD',
                              style: h6Dark,
                            ),
                          ),
                        ),
                      ],
                    )),
              )
            ],
          ),
        ),
        Expanded(
          flex: 1,
          child: ListView.builder(
              itemCount: 4,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Container(
                    margin: EdgeInsets.symmetric(horizontal: 10, vertical: 7),
                    // height: 300,
                    width: MediaQuery.of(context).size.width * .85,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: darkColor,
                        image: DecorationImage(
                            image: AssetImage('assets/images/${index + 1}.png'),
                            fit: BoxFit.cover)),
                    child: null);
              }),
        ),
        SizedBox(height: 10),
        Container(
            padding: EdgeInsets.only(left: 10),
            alignment: Alignment.topLeft,
            child: Text(
              'Markets',
              style: h5,
            )),
        Expanded(
          flex: 3,
          child: ListView.builder(
              itemCount: 9,
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) {
                final info = coins.toList();
                return ListTile(
                    leading: Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: lightColor.withOpacity(0.5),
                      ),
                      child: Icon(
                        Icons.thumb_up,
                        size: 17,
                      ),
                    ),
                    trailing: Image.asset('assets/images/chat${index + 1}.png',
                        height: 30, width: 60),
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          info[index]['name'],
                          style: h5,
                        ),
                        Row(
                          children: [
                            Text(
                              'NGN ' + info[index]['price'],
                              style: h6Dark,
                            ),
                            SizedBox(width: 10),
                            Text(
                              info[index]['percent'],
                              style: h6Green,
                            ),
                          ],
                        ),
                        Divider(
                          color: lightColor.withOpacity(0.2),
                        )
                      ],
                    ));
              }),
        )
      ]),
    );
  }
}
