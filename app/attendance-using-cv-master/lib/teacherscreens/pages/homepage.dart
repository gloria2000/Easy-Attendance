import 'package:attendance_using_cv/teacherscreens/pages/csameraScreen.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'add_details_page.dart';
import 'navigation_menu.dart';
import 'success.dart';

class Page1 extends StatefulWidget {
  const Page1({
    Key? key,
    required this.camera,
  }) : super(key: key);

  final CameraDescription camera;

  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavigationDrawerWidget(),
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "Home",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontFamily: "Roboto",
          ),
        ),
        backgroundColor: Color(0xCCB958A5),
        centerTitle: true,
      ),
      body: Column(children: [
        SizedBox(height: 85),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => (AddDetailsPage(
                                camera: widget.camera,
                              ))),
                    );
                  },
                  child: Container(
                    width: 128,
                    height: 110,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border:
                            Border.all(width: 2.0, color: Color(0x99B958A5)),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10.0),
                          topRight: Radius.circular(10.0),
                          bottomLeft: Radius.circular(10.0),
                          bottomRight: Radius.circular(10.0),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0x40000000),
                            blurRadius: 4.0,
                            offset: Offset(0, 4),
                          ),
                        ]),
                    child: Center(
                      child: Text(
                        'Take Attendance',
                        style: TextStyle(
                          color: Color(0xCCB958A5),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Column(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => (Success(present: 1))),
                    );
                  },
                  child: Container(
                    width: 128,
                    height: 110,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border:
                            Border.all(width: 2.0, color: Color(0x99B958A5)),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10.0),
                          topRight: Radius.circular(10.0),
                          bottomLeft: Radius.circular(10.0),
                          bottomRight: Radius.circular(10.0),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0x40000000),
                            blurRadius: 4.0,
                            offset: Offset(0, 4),
                          ),
                        ]),
                    child: Center(
                      child: Text(
                        'View Reports',
                        style: TextStyle(
                          color: Color(0xCCB958A5),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
        SizedBox(height: 58),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => (Page1(
                                camera: widget.camera,
                              ))),
                    );
                  },
                  child: Container(
                    width: 128,
                    height: 110,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border:
                            Border.all(width: 2.0, color: Color(0x99B958A5)),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10.0),
                          topRight: Radius.circular(10.0),
                          bottomLeft: Radius.circular(10.0),
                          bottomRight: Radius.circular(10.0),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0x40000000),
                            blurRadius: 4.0,
                            offset: Offset(0, 4),
                          ),
                        ]),
                    child: Center(
                      child: Text(
                        'Manage Issues',
                        style: TextStyle(
                          color: Color(0xCCB958A5),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Column(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => (Success(present: 1))),
                    );
                  },
                  child: Container(
                    width: 128,
                    height: 110,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border:
                            Border.all(width: 2.0, color: Color(0x99B958A5)),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10.0),
                          topRight: Radius.circular(10.0),
                          bottomLeft: Radius.circular(10.0),
                          bottomRight: Radius.circular(10.0),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0x40000000),
                            blurRadius: 4.0,
                            offset: Offset(0, 4),
                          ),
                        ]),
                    child: Center(
                      child: Text(
                        'Download Attendance',
                        style: TextStyle(
                          color: Color(0xCCB958A5),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ]),
    );
  }
}
