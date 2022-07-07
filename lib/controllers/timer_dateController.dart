import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class TimeController extends GetxController{
  List<TextEditingController>textController=[
    for(int i=0;i<10;i++) TextEditingController()
  ];

  DateTime dateTime= DateTime.now();


  stetDate(context){
    return showDatePicker(
      context: context, 
      initialDate: DateTime.now(), 
      firstDate: DateTime.now(), 
      lastDate: DateTime(DateTime.now().year+1),
      selectableDayPredicate: (DateTime val)=>val.weekday==5 || val.weekday==6?false:true
      ).then((date){
        textController[1].text= DateFormat('yyyy-MM-dd').format(date!).toString();
      });
  }
  // setTime(context){
  //   return showTimePicker(
  //     context: context, 
      
     
  // }
}