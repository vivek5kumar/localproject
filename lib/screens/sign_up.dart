import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mycollage/controllers/loginController.dart';
import 'package:mycollage/custom_widget/text_formfield.dart';
import 'package:mycollage/screens/checkbox.dart';
import 'package:mycollage/screens/leavePage.dart';
import 'package:mycollage/screens/loginPage.dart';
import 'package:mycollage/screens/scretcher.dart';
import 'package:mycollage/screens/verifyOtp.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();
  bool isLoading = false;
  bool isPressed = false;

  bool isTermCondition = false;
  @override
  Widget build(BuildContext context) {
    final signUpController = Get.put(LoginController());
    return SafeArea(
        child: Scaffold(
            backgroundColor: Colors.blue.shade100,
            body: Card(
              elevation: 5,
              // shape: RoundedRectangleBorder(
              //   borderRadius: BorderRadius.circular(15),
              //   side: BorderSide(width: 2, color: Colors.green)
              // ),
              child: Form(
                key: _formKey,
                child: ListView(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 30),
                      child: Center(
                          child: Row(
                        children: [
                          InkWell(
                            onTap: () {
                              Get.to(const LoginPage());
                            },
                            child: const Icon(Icons.arrow_left),
                          ),
                          const Center(
                            child: Text(
                              "My Account",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Colors.redAccent,
                              ),
                            ),
                          ),
                        ],
                      )),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Row(
                        children: [
                          Flexible(
                              child: RoundedTextField(
                            ctrl: signUpController.textController[2],
                            validateMode: AutovalidateMode.onUserInteraction,
                            heading: "First Name",
                            hint: "User name...",
                            validator: (value) {
                              if (value.isEmpty) {
                                return "Required";
                              }
                            },
                          )),
                          Flexible(
                              child: RoundedTextField(
                            ctrl: signUpController.textController[3],
                            validateMode: AutovalidateMode.onUserInteraction,
                            heading: "Last Name",
                            hint: "Enter last name..",
                            validator: (value) {
                              if (value.isEmpty) {
                                return "Required";
                              }
                            },
                          )),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      child: RoundedTextField(
                        ctrl: signUpController.textController[4],
                        validateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) {
                          if (value.isEmpty) {
                            return "Required";
                          }
                        },
                        heading: 'Email',
                        hint: "Enter user-id",
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      child: RoundedTextField(
                        ctrl: signUpController.textController[5],
                        validateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) {
                          if (value.isEmpty) {
                            return "Required";
                          }
                        },
                        security: !signUpController.showPass1.value,
                        heading: "Password",
                        hint: "Enter password",
                        suffix: InkWell(
                          onTap: () {
                            setState(() {
                              signUpController.setPass1();
                            });
                          },
                          child: Icon(signUpController.showPass1.value
                              ? Icons.visibility
                              : Icons.visibility_off),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      child: RoundedTextField(
                        ctrl: signUpController.textController[6],
                        validateMode: AutovalidateMode.onUserInteraction,
                        security: !signUpController.showPass2.value,
                        heading: "Conform Pass",
                        suffix: InkWell(
                          onTap: () {
                            setState(() {
                              signUpController.setPass2();
                            });
                          },
                          child: Icon(signUpController.showPass2.value
                              ? Icons.visibility
                              : Icons.visibility_off),
                        ),
                        validator: (value) {
                          if (value.isEmpty) {
                            return "Required";
                          } else if (value.length >= 14) {
                            return "Your passwor must be 14 sigits only";
                          }
                        },
                      ),
                    ),
                    // Padding(
                    //   padding: const EdgeInsets.symmetric(vertical: 12),
                    //   child: InkWell(
                    //     onTap: (){
                    //       signUpController.selectTime(context, 1);
                    //     },
                    //     child: RoundedTextField(
                          
                    //       readOnly: true,
                    //       ctrl: signUpController.textController[7],
                    //       validateMode: AutovalidateMode.onUserInteraction,
                    //       security: !signUpController.showPass2.value,
                    //       // heading: "Conform Pass",
                    //       hint: "Select time...",
                    //       validator: (value) {
                    //         if (value.isEmpty) {
                    //           return "Required";
                    //         }
                    //       },
                    //     ),
                    //   ),
                    // ),
                    // RoundedTextField(
                    //   input: TextInputType.number,
                    //   validateMode: AutovalidateMode.onUserInteraction,
                    //   heading: "Add Amount",
                    //   hint: "Add Money",
                    //   validator: (val){

                    //     if(val.isEmpty){
                    //       return "Required";
                    //     }else if(int.parse(val.toString())>=50 && int.parse(val.toString())<=1000){
                    //       return "";
                    //     }
                    //     else{
                    //       return "You can add more than 50 and less than 1000";
                    //     }
                    //   },
                    // ),
                    // Padding(
                    //   padding: const EdgeInsets.all(8.0),
                    //   child: Text("You can add min 50 and max 1000"),
                    // ),
                    Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Container(
                          width: 250,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(40)),
                          child: ElevatedButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                 Get.to(MyStatefulWidget());
                              }
                            },
                            child: const Text("SIGNUP"),
                            style: ElevatedButton.styleFrom(
                                shape: const StadiumBorder()),
                          ),
                        )),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Checkbox(
                            value: isTermCondition,
                            onChanged: (val) {
                              setState(() {
                                isTermCondition = val ?? false;
                              });
                            }),
                        const Center(
                          child: Text("Already have an account? "),
                        ),
                        ElevatedButton(
                          onPressed: isTermCondition
                              ? () {
                                  Get.to(LoginPage());
                                }
                              : null,
                          child: const Text('Login'),
                        ),
                      ],
                    ),
                    // Padding(
                    //   padding: const EdgeInsets.symmetric(horizontal: 100),
                    //   child: RaisedButton(onPressed: (){Get.to(chatWidget());},
                    //   child: Text("Login"),
                    //   ),
                    // )
                  ],
                ),
              ),
            )));
  }
}
