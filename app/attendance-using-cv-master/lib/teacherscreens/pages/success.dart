import 'dart:io';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flowder/flowder.dart';
import 'package:path_provider/path_provider.dart';
import 'package:open_file/open_file.dart';

class Success extends StatefulWidget {
  final int present;
  const Success({Key? key, required this.present}) : super(key: key);

  @override
  State<Success> createState() => _SuccessState();
}

class _SuccessState extends State<Success> {
  late DownloaderUtils options;
  late DownloaderCore core;
  late final String path;

  @override
  void initState() {
    super.initState();

    initPlatformState();
  }

  Future<void> initPlatformState() async {
    _setPath();
    if (!mounted) return;
  }

  void _setPath() async {
    Directory _path = await getApplicationDocumentsDirectory();
    String _localPath = _path.path + Platform.pathSeparator + 'Download';
    final savedDir = Directory(_localPath);
    bool hasExisted = await savedDir.exists();
    if (!hasExisted) {
      savedDir.create();
    }
    path = _localPath;
  }

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
            "Attendace marked...",
            style: const TextStyle(color: Color(0xff4C3F91), fontSize: 17),
          ),
          ElevatedButton(
              onPressed: () async {
                options = DownloaderUtils(
                  progressCallback: (current, total) {
                    final progress = (current / total) * 100;
                    print('Downloading: $progress');
                  },
                  file: File('$path/Attendance.csv'),
                  progress: ProgressImplementation(),
                  onDone: () {
                    OpenFile.open('$path/Attendance.csv');
                  },
                  deleteOnCancel: true,
                );
                core = await Flowder.download(
                  "https://3814-117-232-108-34.in.ngrok.io/AttendanceList.csv",
                  options,
                );
              },
              child: Text("Download Attendance (.xls)"))
        ]),
        Positioned(
            child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Image.asset("assets/images/home.png")),
            left: 33,
            bottom: 33)
      ]),
    );
  }
}
