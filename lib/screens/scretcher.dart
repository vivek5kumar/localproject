import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class chatWidget extends StatefulWidget {
  const chatWidget({Key? key}) : super(key: key);

  @override
  State<chatWidget> createState() => _chatWidgetState();
}

class _chatWidgetState extends State<chatWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("chat"),
      ),
    );
  }
}