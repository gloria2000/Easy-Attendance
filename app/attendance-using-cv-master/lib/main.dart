import 'dart:async';
import 'dart:io';
import 'package:attendance_using_cv/login_p_hod.dart';
import 'package:attendance_using_cv/teacherscreens/pages/absentee_list_page.dart';
import 'package:attendance_using_cv/teacherscreens/pages/add_details_page.dart';
import 'package:attendance_using_cv/teacherscreens/pages/csameraScreen.dart';
import 'package:attendance_using_cv/teacherscreens/pages/homepage.dart';
import 'package:attendance_using_cv/teacherscreens/pages/navigation_menu.dart';
import 'package:attendance_using_cv/teacherscreens/pages/login.dart';

import 'package:attendance_using_cv/login_p_teah.dart';
import 'package:attendance_using_cv/login_page_stud.dart';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

Future<void> main() async {
  // Ensure that plugin services are initialized so that `availableCameras()`
  // can be called before `runApp()`
  WidgetsFlutterBinding.ensureInitialized();

  // Obtain a list of the available cameras on the device.
  final cameras = await availableCameras();

  // Get a specific camera from the list of available cameras.
  final firstCamera = cameras.first;

  runApp(MyApp(
    camera: firstCamera,
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
    required this.camera,
  }) : super(key: key);

  final CameraDescription camera;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Attendance',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.yellow,
      ),
      home: Page1(
        camera: camera,
      ),
    );
  }
}
