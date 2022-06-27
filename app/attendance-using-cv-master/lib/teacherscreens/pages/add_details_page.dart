// ignore_for_file: prefer_const_constructors, non_constant_identifier_names

import 'package:attendance_using_cv/teacherscreens/pages/csameraScreen.dart';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:image_picker/image_picker.dart';
import 'package:attendance_using_cv/main.dart';
// import 'package:date_time_picker/date_time_picker.dart';

class AddDetailsPage extends StatefulWidget {
  const AddDetailsPage({
    Key? key,
    required this.camera,
  }) : super(key: key);

  final CameraDescription camera;

  @override
  State<AddDetailsPage> createState() => _AddDetailsPageState();
}

class _AddDetailsPageState extends State<AddDetailsPage> {
  late DateTime selectedDate;
  late int noOfHours;
  late String classAndSection;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xCCB958A5),
        centerTitle: true,
        title: Text('Attendance'),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        margin: const EdgeInsets.symmetric(
          horizontal: 25,
          vertical: 50,
        ),
        child: Column(children: [
          SizedBox(
            height: 50,
          ),
          Tile(() {}, 'Date', '19-03-2022'),
          Tile(() {}, 'Hour', '10am- 12pm'),
          Tile(() {}, 'Class', 'S8 CSE'),
          Expanded(child: SizedBox()),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => (TakePictureScreen(
                          camera: widget.camera,
                        ))),
              );
            },
            child: TakeAttendanceButton(),
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => (TakePictureScreen(
                          camera: widget.camera,
                        ))),
              );
            },
            child: TakeAttendanceButton(),
          )
        ]),
      ),
    );
  }
}

// the datatypes can be changed
Widget Tile(Function fn, String first, String second) {
  return Column(
    children: [
      SizedBox(height: 5),
      Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            first + " :",
            style: _textStyle,
          ),
          GestureDetector(
            onTap: () => fn,
            child: Container(
              width: 147,
              height: 38,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.transparent,
                  border: Border.all(
                    color: Color(0x99B958A5),
                    width: 1,
                    style: BorderStyle.solid,
                  )),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    second,
                    style: _textStyle,
                  ),
                  Icon(
                    Icons.arrow_drop_down_outlined,
                    color: Color(0xCCB958A5),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
      SizedBox(height: 5),
      Divider(
        color: Color(0x99B958A5),
      ),
    ],
  );
}

TextStyle _textStyle = TextStyle(
  color: Color(0xCCB958A5),
  fontSize: 18,
);

Widget TakeAttendanceButton() {
  return Container(
    height: 54,
    width: 294,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(30),
      color: Color(0xCCB958A5),
    ),
    child: Stack(
      // ignore: prefer_const_literals_to_create_immutables
      children: [
        Center(
          child: Text(
            'Take Attendence',
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        ),
        Positioned(
            right: 3,
            top: 4,
            child: Container(
              height: 45,
              width: 45,
              decoration: BoxDecoration(
                  color: Color(0xCC4C3F91),
                  borderRadius: BorderRadius.circular(30)),
              child: Icon(
                Icons.camera_alt_rounded,
                size: 20.34,
                color: Colors.white,
              ),
            ))
      ],
    ),
  );
}
