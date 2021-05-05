import 'package:flutter/material.dart';
import 'package:hagglex/config.dart';

class Button extends StatelessWidget {
  String title;
  String type;
  Button(this.title, this.type);

  @override
  Widget build(BuildContext context) {
    return type == 'gradient' ? Container(
      
        width:MediaQuery.of(context).size.width*0.8,
        height:40,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(5),
        gradient: type =='gradient'? buttonGradient:'',
        // color: type =='color' ? yellowColor:'',
        ),
        child: Center(child: Text(title, style: h5White,),)
      
    ): Container(
      
        width:MediaQuery.of(context).size.width*0.8,
        height:40,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(5),
        // gradient: type =='gradient'? buttonGradient:'',
        color: type =='color' ? yellowColor:'',
        ),
        child: Center(child: Text(title, style: h5,),)
      
    );
  }
}