import 'package:flutter/material.dart';
import 'package:hagglex/config.dart';

class TextInput extends StatefulWidget {
  
  final String labelText;
  final String mode;
  final bool hideText;
  final IconButton icon;
  final dynamic enabled;
  final TextInputType keyboardType;
  TextEditingController controller;

  TextInput(
      {
      this.labelText,
      this.mode,
      this.hideText,
      this.icon,
      this.controller,
      this.keyboardType,
      this.enabled,
      
      });

  @override
  _TextInputState createState() => _TextInputState();
}

class _TextInputState extends State<TextInput> {
  Widget build(BuildContext context) {
    return Container(
        height: 40,
        margin: EdgeInsets.only( top: 17),
        child: TextFormField(
          controller: widget.controller,
          obscureText: widget.hideText,
          keyboardType: widget.keyboardType == null ? TextInputType.text: widget.keyboardType,
          enabled: widget.enabled,
          style: widget.mode==null?text:textDark,
          decoration: InputDecoration(
                  labelText: widget.labelText,
                  focusColor: lightColor,
                  labelStyle: widget.mode==null?text:textDark,
                  errorStyle: errorText,
                  suffixIcon: widget.icon,
                  contentPadding: EdgeInsets.only(top:2),
                  enabled: true,
                  enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: widget.mode==null?whiteColor:darkColor)),
                  border: UnderlineInputBorder(borderSide: BorderSide(color:Colors.red ,width: 1))
                ),
          validator: (value) {
            if (value.isEmpty) {
              return 'Field cannot be empty';
            }
            return null;
          },
        ));
  }
}
