import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class DropDownController extends GetxController{
  int radioButton=1;
  List<TextEditingController>textController=[
    for(int i=0;i<10;i++) TextEditingController()
  ];
 String selectApproval="Select";
 bool selectSwitch=false;
 bool color=false;
  List name=[
     {'id': 'Select', 'value': 'Select'},
    {'id': 'BRIJESH GUPTA', 'value': '760'},
    {'id': 'AMIT KHAITAN ', 'value': '735'},
    {'id': 'ABHINAV ANAND', 'value': '736'},
    {'id': 'PARAG PHUKAN', 'value': '739'}
  ];

String selectLeave="Select";
List leaveType=[
   {'id': 'Select', 'value': 'Select'},
    {'id': 'Casual leave', 'value': 'CL'},
    {'id': 'Medical Leave', 'value': 'ML'},
    {'id': 'Restricted Leave', 'value': 'RL'},  
];

String selectWork="Select";
List workType=[
  {'id':'Select','value':'Select'},
  {'id':'WHO','value':'WHO'},
  {'id':'WFCO','value':'WFCO'},
];


  setApproval(val){
selectApproval=val;
update();
  }

setLeave(val){
  selectLeave=val;
}
setWork(val){
  selectLeave=val;
}

setSwitch(val){
  selectSwitch=val;
  update();
}

  setRadio(e){
    selectLeave="Select";
    switch(e){
      case 1:{
          radioButton=1;
          break;
      }
      case 2:{
          radioButton=2;
          break;
      }
    }
    update();
  }

   getSystemTime() {
    var now = DateTime.now();
    return DateFormat("HH:mm:ss a").format(now);
  }
}



