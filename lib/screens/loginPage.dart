
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mycollage/controllers/loginController.dart';
import 'package:mycollage/custom_widget/regexer.dart';
import 'package:mycollage/custom_widget/text_formfield.dart';
import 'package:mycollage/screens/create_new_pass.dart';
import 'package:mycollage/screens/sign_up.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({ Key? key }) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey=GlobalKey<FormState>();
  bool isLoading=false;
  @override
  Widget build(BuildContext context) {
final loginController= Get.put(LoginController());
    final Size=MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.blue.shade100,
      appBar: AppBar(
      ),
      body: GetBuilder<LoginController>(builder: (controller) {
        return Form(
          key: _formKey,
          child: Center(
            child: Flexible(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  
                  const Text("User Login",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,),),
                 
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                  ),
                  // Text("UserId:"),
                  RoundedTextField(
                    ctrl: loginController.textController[0],
                    validateMode: AutovalidateMode.onUserInteraction,
                    preFix: const Icon(Icons.account_box,),
                    // heading: "Email Id:",
                    hint: "Enter user id...",
                    validator: (val){
                      if(val!.isEmpty){
                        return "Required";
                      }else if(!emailRegex.hasMatch(val.trim())){
                        return "Provide valide email-id";
                      }
                    },
                    
                  ),
                    
                   const Padding(
                    padding: EdgeInsets.all(8.0),
                  ),
                  RoundedTextField(
                    ctrl: loginController.textController[1],
                    validateMode: AutovalidateMode.onUserInteraction,
                    maxLength: 14,
                    counterText: "",
                    security: !loginController.showPass.value,
                    preFix: const Icon(Icons.lock,),
                     validator: (val){
                      if(val.isEmpty){
                        return "Required";
                      }else if(val.length<6){
                        return "Password must be 6 digits ";
                      }
                      },
                    suffix: InkWell(
                      onTap: (){
                        loginController.setPass();
                      },
                      child: Icon(
                        loginController.showPass.value?Icons.visibility:Icons.visibility_off),),
                    
                    heading: "Password :",
                    hint: "Enter password...",
                  ),
                 
                  TextButton(onPressed: (){
                    Get.to(NewPassword());
                  }, child: Text("Forgot Password?")),
        
                  Container(
                    width: 200,
                    child: Obx(()=>ElevatedButton(
                      
                      onPressed: () {   
                      if(_formKey.currentState!.validate()){
                        loginController.userLogin(false);
                      }else {
                      //    showDialog(context: context, builder: (context){
                      //   return AlertDialog(
                      //     title: Text("Enter valid userid and password!"),
                      //     actions: [
                      //       ElevatedButton(onPressed: (){
                      //         Get.back();
                      //       }, child: Text("Retry"))
                      //     ],
                      //   );
                      // });
                      }
                     
                      },
                      child: !loginController.isLoading.value
                      ?Text("Login")
                      :Padding(
                        padding: const EdgeInsets.all(1.0),
                        child: CircularProgressIndicator(color: Colors.red,),
                      ) 
                    ),)
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                     const Text(
                              "Already have an account? ",
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 16),
                            ),
                            InkWell(
                              onTap: () => Get.to(SignUp()),
                              child: Text(
                                "Sign Up",
                                style: TextStyle(color: Colors.blue, fontSize: 16),
                                
                              ),
                       )
                    ],
                  ) 
                ],
              ),
            ),
          ),
        );
      },
      ),
    );
  }
}