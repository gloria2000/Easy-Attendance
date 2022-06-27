// ignore_for_file: prefer_const_constructors, non_constant_identifier_names
// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:attendance_using_cv/teacherscreens/pages/success.dart';
import 'package:flutter/material.dart';

class AbsenteeListPage extends StatelessWidget {
  final String attendance;
  final String countAbsent;
  const AbsenteeListPage(
      {Key? key, required this.attendance, required this.countAbsent})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    String no_of_absent;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color.fromARGB(204, 190, 44, 161),
        centerTitle: true,
        title: Text(
          'Attendance',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        margin: const EdgeInsets.symmetric(
          horizontal: 25,
          vertical: 50,
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'No. of Absentees :' + countAbsent,
                textAlign: TextAlign.start,
                style: TextStyle(color: Color(0xFF4C3F91), fontSize: 20),
              ),
              Divider(
                color: Color(0x99B958A5),
              ),
              SizedBox(
                height: 50,
              ),
              //roll no 1
              Card(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Aparna"),
                    Text(attendance[0] == '0' ? 'Absent' : 'Present')
                  ],
                ),
              ),
              //roll no 2
              Card(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Anushree"),
                    Text(attendance[1] == '0' ? 'Absent' : 'Present')
                  ],
                ),
              ),
              //roll no 3
              Card(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Dona Mathew"),
                    Text(attendance[2] == '0' ? 'Absent' : 'Present')
                  ],
                ),
              ),
              //roll no:4
              Card(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Dona Maria"),
                    Text(attendance[3] == '0' ? 'Absent' : 'Present')
                  ],
                ),
              ),
              //roll no:5
              Card(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Gloria"),
                    Text(attendance[4] == '0' ? 'Absent' : 'Present')
                  ],
                ),
              ),
              //roll no:6
              Card(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Jibin"),
                    Text(attendance[5] == '0' ? 'Absent' : 'Present')
                  ],
                ),
              ),
              //roll no :7
              Card(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Jobin"),
                    Text(attendance[6] == '0' ? 'Absent' : 'Present')
                  ],
                ),
              ),
              //roll no 8
              Card(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Karen"),
                    Text(attendance[7] == '0' ? 'Absent' : 'Present')
                  ],
                ),
              ),
              //roll no :9
              Card(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Merin"),
                    Text(attendance[8] == '0' ? 'Absent' : 'Present')
                  ],
                ),
              ),
              //roll no: 10
              Card(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Nikitha"),
                    Text(attendance[9] == '0' ? 'Absent' : 'Present')
                  ],
                ),
              ),
              //roll no:11
              Card(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Shruti"),
                    Text(attendance[10] == '0' ? 'Absent' : 'Present')
                  ],
                ),
              ),

              SizedBox(
                height: 150,
              ),
              Center(
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => (Success(
                                present: 1,
                              ))),
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color(0xFF4BD37B),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    height: 45,
                    width: 145,
                    child: Center(
                      child: Text(
                        'Verify',
                        style: _style,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Widget Tab(String name) {
//   return Center(
//     child: Container(
//       margin: EdgeInsets.symmetric(vertical: 10),
//       decoration: BoxDecoration(
//         color: Color(0xCCB958A5),
//         borderRadius: BorderRadius.circular(25),
//       ),
//       width: 283,
//       height: 40,
//       child: Stack(children: [
//         Positioned(
//           left: 20,
//           top: 8,
//           child: Text(
//             name,
//             style: _style,
//           ),
//         ),
//         Positioned(
//           right: 0,
//           child: Container(
//             decoration: BoxDecoration(
//               color: Color(0xA1F40808),
//               borderRadius: BorderRadius.circular(25),
//             ),
//             height: 40,
//             width: 51,
//             child: Icon(
//               Icons.check_rounded,
//               size: 16,
//               color: Colors.white,
//             ),
//           ),
//         )
//       ]),
//     ),
//   );
// }

TextStyle _style = TextStyle(fontSize: 18, color: Colors.white);
