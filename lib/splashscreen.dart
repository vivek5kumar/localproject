
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mycollage/bottomNav.dart';
import 'package:mycollage/controllers/loginController.dart';
import 'package:mycollage/screens/loginPage.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'custom_widget/splash_image.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({ Key? key }) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
final loginController=Get.put(LoginController());
late SharedPreferences prefs;
bool isLogin=false;

checkLogin() async {
  prefs= await SharedPreferences.getInstance();
  isLogin=prefs.getBool("isLogin")??false;

  if(!isLogin){
    Timer(const Duration(seconds: 5), ()=>Get.off(()=>LoginPage()));
  }else{
    loginController.textController[0].text=prefs.getString("username")!;
    loginController.textController[1].text=prefs.getString("password")!;
    await loginController.userLogin(isLogin);
    Timer(const Duration(seconds: 3), ()=>Get.off(const BottomNav()));
  }
}
  @override
  void initState() {
    super.initState();
    checkLogin();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      body: Center(
        
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
          Image(image: AssetImage(ImageAssets.splashlogo))
          
      ]),
      
          
        ));
  
  }
}