

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mycollage/controllers/loginController.dart';
import 'package:mycollage/screens/loginPage.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class VerifyOtp extends StatefulWidget {
  const VerifyOtp({ Key? key }) : super(key: key);

  @override
  State<VerifyOtp> createState() => _VerifyOtpState();
}

class _VerifyOtpState extends State<VerifyOtp> {
  bool isLoading=false;
  @override
  Widget build(BuildContext context) {
    final verifyContro=Get.put(LoginController());
    return Scaffold(
      // backgroundColor: Colors.yellowAccent,
      appBar: AppBar(),

      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        Text("Verify your Email",style:TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
        SizedBox(
          height: 25.0,
        ),
        Text("Please enter 4 digit verification code sent to} ",style: TextStyle(color: Colors.red),),
         Padding(
            padding: const EdgeInsets.all(8.0),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(80, 30, 80, 0),
              child: PinCodeTextField(
                cursorColor: Colors.red,
                appContext: context,
                length: 4,
                keyboardType: TextInputType.number,
                onChanged: (value){},
                ),
            ),
          ),
          Container(
            width: 200,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(shape: StadiumBorder()),
              onPressed: (){
                Get.off(LoginPage());
              }, child: 
              
              Text("Verify")),
            
            )
      ],),
    );
  }
}