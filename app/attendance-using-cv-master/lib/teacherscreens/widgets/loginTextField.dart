import 'package:flutter/material.dart';

class LoginTextField extends StatelessWidget {
  final String str;
  const LoginTextField({Key? key, required this.str}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 54,
        width: 297,
        decoration: BoxDecoration(
            color: const Color(0xffD59BC9),
            borderRadius: BorderRadius.circular(32)),
        child: TextField(
            cursorColor: Colors.white70,
            cursorHeight: 23,
            style: const TextStyle(color: Colors.white, fontSize: 17),
            obscureText: (str == "Password") ? true : false,
            decoration: InputDecoration(
              hintText: str,
              hintStyle: const TextStyle(color: Colors.white70, fontSize: 16),
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 20, horizontal: 24),
              border: InputBorder.none,
            )),
      ),
    );
  }
}
