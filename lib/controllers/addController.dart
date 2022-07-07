
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class AddController extends GetxController{
  final nameController = TextEditingController();
  List<String> item=[];
 DateTime dateTime = DateTime.now();
  bool isButtonActive=true;

  void buttonfun(){
    isButtonActive=false;
    update();
  }

setDate(){
  DateTime dateTime = DateTime.now();
  String formattedDate = DateFormat('MM-dd-yyyy hh:mm aaa').format(dateTime);
return formattedDate;
}

  addItem(String items){
    item.add(items);
    update();
     Get.back();
    nameController.clear();
    // print(item);
  }

  deleteItem(int index){
    item.removeAt(index);
    update();
}

 getTime(val) {
    var date2 = DateTime.parse(val);
    var date1 = DateTime.now();
    // var difference = date2.difference(date1).inSeconds;
    // String time = formatTime(difference);
    var diff = date2.difference(date1);
    var days = diff.inDays;
    var hours = diff.inHours % 24;
    var minutes = diff.inMinutes % 60;
    var seconds = diff.inSeconds % 60;
    return "${days}d" "${hours}h:" "${minutes}m:" "${seconds}s";
  }
 
  // String formatTime(int seconds) {
  //   return '${(Duration(seconds: seconds))}'.split('.')[0].padLeft(8, '0');
  // }

// setdate(context){
//   return showDatePicker(context: context,
//    initialDate: dateTime, firstDate: DateTime(2005), 
//    lastDate: DateTime(2022)).then((value){
//     dateTime=value!;
//    });
// }

  // TimeOfDay selectTime = TimeOfDay.now();

  // Future<Null> showtime(context) async {
  //   final TimeOfDay? storetime = await showTimePicker(
  //       context: context,
  //       initialTime: selectTime,
  //       builder: (context, child) {
  //         return MediaQuery(
  //             data: MediaQuery.of(context).copyWith(
  //                 // Using 12-Hour format
  //                 alwaysUse24HourFormat: true),
  //             child: child!);
  //       });
  //   if (selectTime != null) {
  //      selectTime = storetime!;
  //   }
  //   update();
  // }
}