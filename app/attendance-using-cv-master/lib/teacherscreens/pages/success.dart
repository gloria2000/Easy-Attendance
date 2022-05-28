import 'package:flutter/material.dart';

class Success extends StatelessWidget {
  final int present;
  const Success({Key? key, required this.present}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          "Attendance",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: const Color(0xffC779B7),
      ),
      body: Stack(children: [
        Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          const SizedBox(height: 115),
          Stack(children: [
            Center(child: Image.asset("assets/images/verified.png")),
            Positioned(
              child: Image.asset("assets/images/tick.png"),
              left: 140,
              top: 60,
            )
          ]),
          const SizedBox(
            height: 51,
          ),
          const Text("Complete !",
              style: TextStyle(color: Color(0xff4BD37B), fontSize: 20)),
          const SizedBox(
            height: 20,
          ),
          Text(
            present.toString() + "/67 students are present",
            style: const TextStyle(color: Color(0xff4C3F91), fontSize: 17),
          )
        ]),
        Positioned(
            child: GestureDetector(
                onTap: () {}, child: Image.asset("assets/images/home.png")),
            left: 33,
            bottom: 33)
      ]),
    );
  }
}
