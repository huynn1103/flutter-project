import 'package:flutter/material.dart';
import 'package:student_internships_management/views/ListClassroom/WrapListClassroom.dart';
import 'package:student_internships_management/views/ListStudent/WrapperList.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Quản lý sinh viên thực tập',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: WrapListClassroom(),
    );
  }
}
