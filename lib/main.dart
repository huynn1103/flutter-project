import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student_internships_management/providers/ClassroomProvider.dart';
import 'package:student_internships_management/providers/CompanyProvider.dart';
import 'package:student_internships_management/providers/DepartmentProvider.dart';
import 'package:student_internships_management/providers/MajorProvider.dart';
import 'package:student_internships_management/providers/ReportProvider.dart';
import 'package:student_internships_management/providers/StudentProvider.dart';
import 'package:student_internships_management/providers/TeacherProvider.dart';
import 'package:student_internships_management/views/ListClassroom/WrapListClassroom.dart';
import 'package:student_internships_management/views/ListStudent/WrapperList.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ClassroomProvider>(
          create: (context) => ClassroomProvider(),
        ),
        ChangeNotifierProvider<CompanyProvider>(
          create: (context) => CompanyProvider(),
        ),
        ChangeNotifierProvider<DepartmentProvider>(
          create: (context) => DepartmentProvider(),
        ),
        ChangeNotifierProvider<MajorProvider>(
          create: (context) => MajorProvider(),
        ),
        ChangeNotifierProvider<ReportProvider>(
          create: (context) => ReportProvider(),
        ),
        ChangeNotifierProvider<StudentProvider>(
          create: (context) => StudentProvider(),
        ),
        ChangeNotifierProvider<TeacherProvider>(
          create: (context) => TeacherProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Quản lý sinh viên thực tập',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: WrapListClassroom(),
      ),
    );
  }
}
