import 'package:bubble_bottom_bar/bubble_bottom_bar.dart';
import 'package:flutter/material.dart';
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
                  ),
                );
              },
            ),
      bottomNavigationBar: BubbleBottomBar(
        opacity: .2,
        currentIndex: _bottomNavIndex,
        onTap: (int index) {
          setState(() {
            _bottomNavIndex = index;
          });
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
            backgroundColor: Colors.indigo,
            icon: Icon(
              Icons.dashboard,
              color: Colors.black,
            ),
            activeIcon: Icon(
              Icons.dashboard,
              color: Colors.indigo,
            ),
            title: Text("Home"),
          ),
          BubbleBottomBarItem(
            backgroundColor: Colors.orange,
            icon: Icon(
              Icons.access_time,
              color: Colors.black,
            ),
            activeIcon: Icon(
              Icons.access_time,
              color: Colors.orange,
            ),
            title: Text("Logs"),
          ),
          BubbleBottomBarItem(
            backgroundColor: Colors.green,
            icon: Icon(
              Icons.folder_open,
              color: Colors.black,
            ),
            activeIcon: Icon(
              Icons.folder_open,
              color: Colors.green,
            ),
            title: Text("Folders"),
          ),
          BubbleBottomBarItem(
            backgroundColor: Colors.purple,
            icon: Icon(
              Icons.menu,
              color: Colors.black,
            ),
            activeIcon: Icon(
              Icons.menu,
              color: Colors.purple,
            ),
            title: Text("Menu"),
          )
        ],
      ),
    );
  }
}
