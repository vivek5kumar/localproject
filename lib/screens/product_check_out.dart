
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mycollage/screens/welcome.dart';

class CheckOut extends StatefulWidget {
 final String ?image;
  final String ?name;
  final String ?price;
  final String ? counter;
  CheckOut({ Key? key ,this.image,this.name,this.price,this.counter}) : super(key: key);

  @override
  State<CheckOut> createState() => _CheckOutState();
}

class _CheckOutState extends State<CheckOut> {
    List itemPay=['Your Price','Discount','Shipping','Total'];
  int counter=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Checkout Page"),
      ),
       bottomNavigationBar: Container(
        height: 60,
        width: 100,
        padding: EdgeInsets.only(bottom: 10),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: RaisedButton(
            color: Colors.blue,
            onPressed: (){
              Get.to(Welcome());
            },
          child: Text("Buy"),
          ),
        ),
      ),
      body: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      // mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text("CheckOut"),
          Container(
            height: 140,
            width: double.infinity,
            child: Card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                   Row(
                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                     children: [
                       Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage(widget.image.toString())),
                  ),
                ),
                 Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(widget.name.toString()),
                      Text("Cloth"),
                      Text(widget.price.toString()),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Text("Quantity :"),
                          Text(widget.counter.toString()),
                        ],
                      ),
                      
                    ],
                  ),
                )
                     ],
                   ),
               
                ],
              ),
            ),
          ),
         Column(
           crossAxisAlignment: CrossAxisAlignment.start,
           children: [
             for(int i=0;i<itemPay.length;i++)
             Padding(
               padding: const EdgeInsets.all(8.0),
               child: Text(itemPay[i]),
             ),
           ],
         )
        ],
      ),
      
    );
  }
}