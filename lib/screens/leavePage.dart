import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mycollage/controllers/loginController.dart';
import 'package:mycollage/screens/country.dart';

class LeavePage extends StatefulWidget {
  const LeavePage({ Key? key }) : super(key: key);

  @override
  State<LeavePage> createState() => _LeavePageState();
}

class _LeavePageState extends State<LeavePage> {
  final loginController= Get.put(LoginController());

  bool isToggle=false;
           
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Leave"),
        
        ),
        body:  Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Notification"),
                Switch(
                  activeColor: Colors.blueAccent,
                  inactiveThumbColor: Colors.grey.shade400,
                  value:loginController.istoggle.value ,
                 onChanged: (val){
                   setState(() {
                     loginController.settoggle(val);
    
                   });
                 }
                 ),
              ],
            ),
              Text(loginController.textValue),
             Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
                 Text("Help us,contact center, privecy policy"),
                 Switch(value: loginController.istoggle1.value, 
                 onChanged: (val){
                   setState(() {
                     loginController.setToggle(val);
                   });
                 }),
               ],
             ),
            Text(loginController.textValue1),
            
            Switch(value: loginController.istoggle2.value, 
            onChanged: (val){
                setState(() {
                  loginController.setToggle1(val);
                });
            }),
              Column(
                children: [
                  for(int i=0;i<loginController.countries.length;i++)
                  Card(
                    child: CheckboxListTile(
                      title: Text(loginController.countries[i]),
                      value:loginController.checkBoxValue[i] , 
                      onChanged: (val){
                          setState(() {
                            loginController.checkBoxValue[i]=val!;
                          });
                      }),
                  ),
                ],
              ),

             CupertinoPicker(
               itemExtent: 64,
               children: [
                 Text("items"),
                 Text("items"),
                 Text("items"),
                 Text("items"),
               ],
               onSelectedItemChanged: (index){},
             ),
          ],   
        ),
         
      ),
    );
  }

  
}