import 'package:attendance_using_cv/teacherscreens/widgets/loginTextField.dart';
import 'package:flutter/material.dart';
import 'homepage.dart';
import 'dart:ui';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NotificationListener<OverscrollIndicatorNotification>(
        onNotification: (overScroll) {
          overScroll.disallowIndicator();
          return true;
        },
        child: SingleChildScrollView(
          child: Container(
              padding: const EdgeInsets.only(top: 135, left: 27, right: 27),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      "LOGIN",
                      style: TextStyle(color: Color(0xff4C3F91), fontSize: 46),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Image.asset("assets/images/teacherlogin.png"),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text("Teacher",
                        style:
                            TextStyle(fontSize: 20, color: Color(0xff4C3F91))),
                    const SizedBox(
                      height: 16,
                    ),
                    const LoginTextField(str: "Username"),
                    const SizedBox(
                      height: 38,
                    ),
                    const LoginTextField(str: "Password"),
                    const SizedBox(
                      height: 45,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 150),
                      child: TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Login()),
                            );
                          },
                          child: const Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 5, horizontal: 47),
                            child: Text(
                              "Login",
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                          style: TextButton.styleFrom(
                              primary: Colors.white,
                              backgroundColor:
                                  const Color.fromRGBO(76, 63, 145, 0.8),
                              shape: const StadiumBorder())), // foreground
                    ),
                  ])),
        ),
      ),
    );
  }
}
