import 'package:bubble_bottom_bar/bubble_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:pandabar/main.view.dart';
import 'package:pandabar/pandabar.dart';
import 'package:provider/provider.dart';
import 'package:student_internships_management/models/Classroom.dart';
import 'package:student_internships_management/providers/ClassroomProvider.dart';
import 'package:student_internships_management/widgets/Classroom/CardClassroom.dart';

class ListClassroom extends StatefulWidget {
  const ListClassroom({Key key, this.departmentId}) : super(key: key);

  final String departmentId;

  @override
  _ListClassroomState createState() => _ListClassroomState();
}

class _ListClassroomState extends State<ListClassroom> {
  int _bottomNavIndex = 0;
  List<Classroom> classes = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    var classroomProvider = Provider.of<ClassroomProvider>(
      context,
      listen: false,
    );
    if (widget.departmentId != null) {
      classroomProvider.findAll(widget.departmentId).then((value) {
        setState(() {
          classes = value;
        });
      });
    } else {
      classroomProvider.findAll('1').then((value) {
        setState(() {
          classes = value;
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: classes.isEmpty
          ? Center(
              child: Text(
              'Danh sách lớp trống',
              style: TextStyle(fontSize: 18),
            ))
          : ListView.builder(
              itemCount: classes.length,
              padding: EdgeInsets.only(bottom: 15),
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  child: CardClassroom(
                    classroom: classes[index],
                    listView: classes,
                    index: index,
                    setState: setState,
                    classroomId: classes[index].id,
                  ),
                );
              },
            ),
      bottomNavigationBar: BubbleBottomBar(
        opacity: .2,
        currentIndex: _bottomNavIndex,
        onTap: (int index) {
          if (index == 0) {
            setState(() {
              _bottomNavIndex = index;
            });
          } else if (index == 1) {
            _bottomNavIndex = index;
          } else if (index == 2) {
            _bottomNavIndex = index;
          } else if (index == 3) {
            _bottomNavIndex = index;
          } else {
            _bottomNavIndex = index;
          }
        },
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
        //new
        hasNotch: true,
        //new
        hasInk: true,
        //new, gives a cute ink effect
        inkColor: Colors.black12,
        //optional, uses theme color if not specified
        items: <BubbleBottomBarItem>[
          BubbleBottomBarItem(
              backgroundColor: Colors.red,
              icon: Icon(
                Icons.dashboard,
                color: Colors.black,
              ),
              activeIcon: Icon(
                Icons.dashboard,
                color: Colors.red,
              ),
              title: Text("Home")),
          BubbleBottomBarItem(
              backgroundColor: Colors.deepPurple,
              icon: Icon(
                Icons.access_time,
                color: Colors.black,
              ),
              activeIcon: Icon(
                Icons.access_time,
                color: Colors.deepPurple,
              ),
              title: Text("Logs")),
          BubbleBottomBarItem(
              backgroundColor: Colors.indigo,
              icon: Icon(
                Icons.folder_open,
                color: Colors.black,
              ),
              activeIcon: Icon(
                Icons.folder_open,
                color: Colors.indigo,
              ),
              title: Text("Folders")),
          BubbleBottomBarItem(
              backgroundColor: Colors.green,
              icon: Icon(
                Icons.menu,
                color: Colors.black,
              ),
              activeIcon: Icon(
                Icons.menu,
                color: Colors.green,
              ),
              title: Text("Menu"))
        ],
      ),
    );
  }
}
