// ignore_for_file: prefer_const_constructors, non_constant_identifier_names
// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class AbsenteeListPage extends StatelessWidget {
  const AbsenteeListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation:0,
        backgroundColor: Color.fromARGB(204, 190, 44, 161),
        centerTitle: true,
        title: Text('Attendance',
        style: TextStyle(color: Colors.white),),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        margin: const EdgeInsets.symmetric(
          horizontal: 25,
          vertical: 50,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Absentees :',
              textAlign: TextAlign.start,
              style: TextStyle(color: Color(0xFF4C3F91), fontSize: 20),
            ),
            Divider(
              color: Color(0x99B958A5),
            ),
            SizedBox(
              height: 50,
            ),
            Tab('Anil S'),
            Tab('Ben O'),
            Tab('Alice T'),
            Tab('George P'),
            SizedBox(height: 150,),
            verifyButton((){})
          ],
        ),
      ),
    );
  }
}

Widget Tab(String name) {
  return Center(
    child: Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: Color(0xCCB958A5),
        borderRadius: BorderRadius.circular(25),
      ),
      width: 283,
      height: 40,
      child: Stack(children: [
        Positioned(
          left: 20,
          top: 8,
          child: Text(
            name,
            style: _style,
          ),
        ),
        Positioned(
          right: 0,
          child: Container(
            decoration: BoxDecoration(
              color: Color(0xA1F40808),
              borderRadius: BorderRadius.circular(25),
            ),
            height: 40,
            width: 51,
            child: Icon(
              Icons.check_rounded,
              size: 16,
              color: Colors.white,
            ),
          ),
        )
      ]),
    ),
  );
}

Widget verifyButton(Function fn) {
  // responsiveness of the button like InkWell splashing would be nice

  return Center(
    child: GestureDetector(
      onTap: () => fn,
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xFF4BD37B),
          borderRadius: BorderRadius.circular(10),
        ),
        height: 45,
        width: 145,
        child: Center(
          child: Text('Verify',
          style: _style,
          ),
        ),),
      ),
  );
}

TextStyle _style = TextStyle(fontSize: 18, color: Colors.white);