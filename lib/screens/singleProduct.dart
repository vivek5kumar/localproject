import 'package:flutter/material.dart';

class SingleProduct extends StatefulWidget {
  final String ?details;
  const SingleProduct({ Key? key,this.details }) : super(key: key);

  @override
  State<SingleProduct> createState() => _SingleProductState();
}

class _SingleProductState extends State<SingleProduct> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
      ),
    );
  }
}