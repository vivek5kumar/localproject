import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mycollage/screens/loginPage.dart';

class Welcome extends StatefulWidget {
  Welcome({Key? key}) : super(key: key);

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  bool _isAcceptTermsAndConditions = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 250,
              width: double.infinity,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage('assets/images/shopping.jpg'))),
            ),
            const Text(
              "Welcome",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),

            const SizedBox(
              height: 25,
            ),
            Container(
              height: 45,
              width: 250,
              child: RaisedButton(
                color: Colors.redAccent,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                onPressed: () {},
                child: const Text("Sign Up"),
              ),
            ),
            // Row(
            //   crossAxisAlignment: CrossAxisAlignment.center,
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [
            //     const Text("Already have an account?"),
            //     TextButton(onPressed: () {}, child: const Text("Login"))
            //   ],
            // )
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Checkbox(
                        value: _isAcceptTermsAndConditions,
                        onChanged: (value) {
                          setState(() {
                            // 2
                            _isAcceptTermsAndConditions = value ?? false;
                          });
                        }),
                    const Text("Already have an account?"),
                    ElevatedButton(
                      // 3
                      onPressed:_isAcceptTermsAndConditions
                          ? () {
                              Get.to(LoginPage());
                            }
                          : null,
                      child: const Text('Login'),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
