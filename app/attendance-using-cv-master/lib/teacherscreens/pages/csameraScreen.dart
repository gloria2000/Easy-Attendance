import 'dart:async';
import 'dart:developer';
import 'dart:io';
import 'package:attendance_using_cv/teacherscreens/pages/absentee_list_page.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:attendance_using_cv/main.dart';
import 'add_details_page.dart';
import 'success.dart';
import 'dart:ui';
import 'package:http/http.dart' as http;
import 'dart:convert';

// A screen that allows users to take a picture using a given camera.
class TakePictureScreen extends StatefulWidget {
  const TakePictureScreen({
    Key? key,
    required this.camera,
  }) : super(key: key);

  final CameraDescription camera;

  @override
  TakePictureScreenState createState() => TakePictureScreenState();
}

class TakePictureScreenState extends State<TakePictureScreen> {
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;

  final images = [];

  @override
  void initState() {
    super.initState();
    // To display the current output from the Camera,
    // create a CameraController.
    _controller = CameraController(
      // Get a specific camera from the list of available cameras.
      widget.camera,
      // Define the resolution to use.
      ResolutionPreset.medium,
    );

    // Next, initialize the controller. This returns a Future.
    _initializeControllerFuture = _controller.initialize();
  }

  @override
  void dispose() {
    // Dispose of the controller when the widget is disposed.
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Take a picture')),
      // You must wait until the controller is initialized before displaying the
      // camera preview. Use a FutureBuilder to display a loading spinner until the
      // controller has finished initializing.
      body: FutureBuilder<void>(
        future: _initializeControllerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            // If the Future is complete, display the preview.
            return CameraPreview(_controller);
          } else {
            // Otherwise, display a loading indicator.
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        // Provide an onPressed callback.
        onPressed: () async {
          // Take the Picture in a try / catch block. If anything goes wrong,
          // catch the error.
          try {
            // Ensure that the camera is initialized.
            await _initializeControllerFuture;

            // Attempt to take a picture and get the file `image`
            // where it was saved.
            final image = await _controller.takePicture();
            images.add(image);

            // If the picture was taken, display it on a new screen.
            await Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => DisplayPictureScreen(
                  // Pass the automatically generated path to
                  // the DisplayPictureScreen widget.
                  imagePath: image.path,
                ),
              ),
            );
          } catch (e) {
            // If an error occurs, log the error to the console.
            print(e);
          }
        },
        child: const Icon(Icons.camera_alt),
      ),
    );
  }
}

// A widget that displays the picture taken by the user.
class DisplayPictureScreen extends StatefulWidget {
  final String imagePath;
  const DisplayPictureScreen({Key? key, required this.imagePath})
      : super(key: key);

  @override
  State<DisplayPictureScreen> createState() => _DisplayPictureScreenState();
}

class _DisplayPictureScreenState extends State<DisplayPictureScreen> {
  File? selectedImage;
  int status_Code = 0;
  bool isLoading = false;

  late String attendance;
  late String countAbsent;
  //function to upload image to the server
  upload() async {
    setState(() {
      isLoading = true;
    });
    final request = http.MultipartRequest(
        "POST",
        Uri.parse(
            "https://558c-2402-3a80-1e19-bd09-c87d-6b21-5d9a-4d4b.ap.ngrok.io/upload"));
    final headers = {"Content-type": "multipart/form-data"};
    request.files.add(http.MultipartFile('image',
        selectedImage!.readAsBytes().asStream(), selectedImage!.lengthSync(),
        filename: selectedImage!.path.split("/").last));

    request.headers.addAll(headers);
    final response = await request.send();

    http.Response res = await http.Response.fromStream(response);
    setState(() {
      if (res.statusCode == 200) {
        status_Code = 200;
        isLoading = false;
      }
    });
    final resJson = json.decode(res.body);
    log(resJson['attendance']);
    attendance = resJson['attendance'];
    countAbsent = resJson['countAbsent'];
    Navigator.pop(context);
    Navigator.pop(context);
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => AbsenteeListPage(
          attendance: attendance.toString(),
          countAbsent: countAbsent,
          //here message gives the number of students present
        ),
      ),
    );
    // return resJson['attendance'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Upload Image"),
        backgroundColor: Color(0xCCB958A5),
      ),
      // The image is stored as a file on the device. Use the `Image.file`
      // constructor with the given path to display the image.
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.file(File(widget.imagePath)),
            Center(
              child: CircularProgressIndicator(
                backgroundColor: Colors.transparent,
                color: Colors.blue,
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          selectedImage = File(widget.imagePath);
          upload();
        },
        child: Icon(Icons.upload),
      ),
    );
  }
}
