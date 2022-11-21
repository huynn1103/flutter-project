import 'package:flutter/material.dart';
import 'package:student_internships_management/data/dummyData.dart';
import 'package:student_internships_management/views/ListClassroom/WrapListClassroom.dart';
import 'package:student_internships_management/views/ListStudent/WrapperList.dart';
import 'package:student_internships_management/widgets/App/DrawerListTile.dart';

class MainDrawer extends StatefulWidget {
  @override
  _MainDrawerState createState() => _MainDrawerState();
}

class _MainDrawerState extends State<MainDrawer> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: departments.map((e) {
        return DrawerListTile(
          name: e.tenKhoa,
          ontap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (BuildContext context) => WrapListClassroom(),
              ),
            );
          },
        );
      }).toList(),
    );
  }
}
