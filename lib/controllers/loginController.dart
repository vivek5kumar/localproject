import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mycollage/auth/api_manager.dart';
import 'package:mycollage/screens/dashboard.dart';
import 'package:mycollage/screens/loginPage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController{
  // final emailController = TextEditingController();
  // final passwordController = TextEditingController();
  List<TextEditingController>textController=[for(int i=0;i<20;i++)TextEditingController()];
  List<bool>checkBoxValue=[false,false,false,false,false];
  List<String> countries = [ "India", "Sri Lanka",
                              "Japan", "South Korea", "Mongolia"];
  RxBool showPass=false.obs;
  RxBool showPass1=false.obs;
  RxBool showPass2=false.obs;
  RxBool isVisible=false.obs;
  RxBool istoggle=false.obs;
  RxBool istoggle1=false.obs;
  RxBool istoggle2=false.obs;
  RxBool isLoading=false.obs;
  RxBool isExistemail=false.obs;
 var userProfiledata;

bool isAccepeTermCondition=false;

  var textValue="Switch id OFF";
  var textValue1="OFF";
  late SharedPreferences prefs;

  

  setLoading(bool val){
    isLoading.value=val ;
  }
termCondn(bool? val){
  isAccepeTermCondition=true;
  update();
}

  setPass(){
    showPass.value= !showPass.value;
    update();
  }
  setPass1(){
    showPass1.value= !showPass1.value;
    update();
  }
  setPass2(){
    showPass2.value= !showPass2.value;
    update();
  }

  settoggle(bool value){
    if(value==true){
      istoggle=true.obs;
      textValue="Switch is ON";
    }else{
      istoggle=false.obs;
      textValue="Switch is OFF";
    }
    update();
  }
  setToggle(bool val){
    if(val==true){
      istoggle1=true.obs;
      textValue1="ON";
      Get.snackbar("Notification", "Your notification is On");
    }else{
      istoggle1=false.obs;
      textValue1="OFF";
       Get.snackbar(
         "Notification", "Your notification is off",
        // overlayBlur: 5,
         colorText: Colors.white,
         backgroundColor: Colors.grey
         );
    }
   update();
   
  }
   setToggle1(bool va){
    if(va==true){
      istoggle2=true.obs;
      
      Get.snackbar("Notification", "Your notification is On");
    }else{
      istoggle2=false.obs;
      
       Get.snackbar(
         "Notification", "Your notification is off",
        // overlayBlur: 5,
         colorText: Colors.white,
         backgroundColor: Colors.grey
         );
    }
   update();
   
  }

  userLogin( bool isRedirect) async{
    prefs= await SharedPreferences.getInstance();
    setLoading(true);
    Map _map={
      'data':textController[0].text.trim() +"||"+textController[1].text.trim(),
      'func':'login',
    };
    print(_map);
    await APIManager().getLogin(_map).then((value)async{
      if(value.status==1){
        prefs.setBool("isLogin",true);
       prefs.setString("username",textController[0].text);
        prefs.setString("password",textController[1].text);
        userProfiledata=value.listData;
        isRedirect?null:Get.off(()=>const Dashboard());
            // emailController.clear();
            // passwordController.clear();
         

      }else{
        // setLoading(true);
        // Get.to(LoginPage());
        // emailController.clear();
        // passwordController.clear();
        // Get.snackbar("Login Failed","Username or password is incorrect.",
        // snackPosition: SnackPosition.TOP,
        //     backgroundColor: Colors.redAccent,
        //     colorText: Colors.white
        // );
      }
      setLoading(false);
    });
  }

 logout(context) async {
   prefs= await SharedPreferences.getInstance();
   prefs.setBool("isLogin",false);
   Get.off(()=>const LoginPage());
 }

  selectTime(context, index) {
    showTimePicker(
            context: context,
            builder: (context, child) => MediaQuery(
                data: MediaQuery.of(context)
                    .copyWith(alwaysUse24HourFormat: true),
                child: child!),
            initialTime: TimeOfDay.now())
        .then((date) {
      if (date != null) {
        index == 1
            ? textController[7].text = "${date.hour.isLowerThan(10)?"0${date.hour}": "${date.hour}"}:${date.minute.isLowerThan(10)? "0${date.minute}": "${date.minute}"}:00"
            : textController[10].text = "${date.hour.isLowerThan(10)?"0${date.hour}": "${date.hour}"}:${date.minute.isLowerThan(10)? "0${date.minute}": "${date.minute}"}:00";
      }
    });

    update();
  }
}
  



