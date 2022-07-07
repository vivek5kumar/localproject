

import 'package:flutter/material.dart';

// ignore: must_be_immutable
class RoundedTextField extends StatelessWidget {
  int?maxLines;
  int?maxLength;
  String?heading;
  String?hint;
  String?style;
  String?counterText;
  bool?security;
  bool ?readOnly;
  Widget?suffix;
  Widget?preFix;
  Widget ?onTap;
  TextInputType?input;
  Color?color;
  AutovalidateMode?validateMode;
  TextEditingController?ctrl;
  // ignore: prefer_typing_uninitialized_variables
  var validator;
  // bool ?autocorrect;
   RoundedTextField({ 
    Key? key,
    this.ctrl,
    this.maxLength,
    this.maxLines ,
    this.heading,
    this.hint,
    this.security,
    this.suffix,
    this.preFix,
    this.color,
    this.validateMode,
    this.validator,
    this.style,
    this.onTap,
  //  this.autocorrect,
   this.counterText,
   this.readOnly,
   this.input
    }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
      readOnly: readOnly??false,
        keyboardType: input,
        // cursorColor: Colors.white,
        // style: TextStyle(color: Colors.redAccent),
        validator: validator,
        // autocorrect: false,
        autovalidateMode: validateMode,
        controller:ctrl,
        obscureText: security??false,
        maxLength: maxLength,
        decoration: InputDecoration(
          counterText: "",
          contentPadding: EdgeInsets.all(10.0),
          hintText: hint,
          labelText: heading,
          suffix: suffix,
          // prefix: preFix,
          prefixIcon: preFix,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10))
        )
      ),
    );
  }
}