import 'package:flutter/material.dart';

class NewPassword extends StatefulWidget {
  const NewPassword({ Key? key }) : super(key: key);

  @override
  State<NewPassword> createState() => _NewPasswordState();
}

class _NewPasswordState extends State<NewPassword> {
  final _formKey=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("New Password"),
      ),
    );
  }
}