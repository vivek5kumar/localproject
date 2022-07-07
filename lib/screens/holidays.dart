import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mycollage/models/login_model.dart';

class Holidays extends StatefulWidget {
  const Holidays({Key? key}) : super(key: key);

  @override
  State<Holidays> createState() => _HolidaysState();
}

class _HolidaysState extends State<Holidays> {
  bool magnification = false;
  List<String> city = [
    "item1",
    "item2",
    "item3",
    "item4",
    "item5",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Holidays"),
        ),
        body: ListView.builder(
          itemCount: city.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      border: Border.all(color: Colors.yellow, width: 2),
                      gradient: const LinearGradient(
                          colors: [Colors.red, Colors.blue])),
                  width: 200,
                  height: 100,
                  child: Center(child: Text(city[index]))),
            );
          },
        ));

    // Container(
    //   width: 300,
    //   height: 200,
    //   decoration: BoxDecoration(
    //     borderRadius: BorderRadius.circular(10.0),
    //       gradient: const LinearGradient(
    //         begin: Alignment.topRight,
    //         end: Alignment.bottomLeft,
    //         colors: [Colors.blue, Colors.red,Colors.blue,])),
    //   child: const Center(
    //     child:  Text(
    //       'Hello Gradient!',
    //       style: TextStyle(
    //         fontSize: 18.0,
    //         fontWeight: FontWeight.bold,
    //         color: Colors.white),
    //     ),
    //   ),
    //  ListWheelScrollView(
    //   itemExtent: 200,
    //   diameterRatio: 1.5,
    //   squeeze: 0.9,
    //   // magnification: 1.5,
    //   // overAndUnderCenterOpacity: 0.8,
    //   onSelectedItemChanged: (data){

    //   ScaffoldMessenger.of(context).showSnackBar(
    //     SnackBar(content: Text("content are : ${data+1}")));},
    //   children: city.map((data){
    //       return SizedBox(
    //         width: 200,
    //         child: ListTile(
    //           title: Container(
    //             height: 200,
    //             child: Card(
    //               color: Colors.redAccent,
    //               child: Center(
    //                 child: Text(data)))),
    //         ),
    //       );
    //   }).toList(),)

    //       ));
  }
}
