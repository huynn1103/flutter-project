import 'package:bubble_bottom_bar/bubble_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student_internships_management/models/Student.dart';
import 'package:student_internships_management/providers/StudentProvider.dart';
import 'package:student_internships_management/views/StudentDetail/CreateOrEditStudent.dart';
import 'package:student_internships_management/widgets/Student/CardStudent.dart';

class ListInternship extends StatefulWidget {
  final bool isReport;
  final String classroomId;
  final String departmentId;

  const ListInternship({
    Key key,
    this.isReport,
    this.classroomId,
    this.departmentId,
  }) : super(key: key);

  @override
  _ListInternshipState createState() => _ListInternshipState();
}

class _ListInternshipState extends State<ListInternship> {
  int _bottomNavIndex = 0;
  TextEditingController editingController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  List<Student> listStudent = [];
  List<Student> students = [];

  @override
  void initState() {
    super.initState();
    var studentProvider = Provider.of<StudentProvider>(
      context,
      listen: false,
    );
    if (widget.classroomId != null) {
      studentProvider.findAll(widget.classroomId).then((value) {
        value.map((e) => listStudent.add(e)).toList();
        setState(() {
          students = value;
        });
      });
    } else {
      studentProvider.findAll('1').then((value) {
        value.map((e) => listStudent.add(e)).toList();
        setState(() {
          students = value;
        });
      });
    }
  }

  // void filterSearchResults(String querySearch) {
  //   if (querySearch.isNotEmpty) {
  //     listStudent.forEach((item) {
  //       if (item.tenSinhVien.contains(querySearch)) {
  //         listStudent.add(item);
  //       }
  //     });
  //     setState(() {
  //       listStudent.clear();
  //       listStudent = students;
  //     });
  //     return;
  //   } else {
  //     setState(() {
  //       listStudent.clear();
  //       listStudent = students;
  //     });
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: students.isEmpty
          ? Center(
              child: Text('Danh sách sinh viên trống',
                  style: TextStyle(fontSize: 18)))
          : Padding(
              padding: const EdgeInsets.all(5),
              child: Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  TextField(
                    onChanged: (value) {
                      // filterSearchResults(value);
                      // editingController.clear();
                    },
                    autofocus: false,
                    controller: editingController,
                    decoration: InputDecoration(
                      labelText: "Search",
                      hintText: "Search",
                      prefixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(25.0),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: students.length,
                      padding: widget.isReport == false
                          ? EdgeInsets.only(bottom: 40)
                          : EdgeInsets.only(bottom: 15),
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          child: CardStudent(
                            student: listStudent[index],
                            listView: listStudent,
                            index: index,
                            setState: setState,
                            isReport: widget.isReport,
                          ),
                        );
                      },
                    ),
                  )
                ],
              ),
            ),
      floatingActionButton: widget.isReport == false
          ? FloatingActionButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CreateOrEditStudent(
                      classroomId: widget.classroomId,
                      departmentId: widget.departmentId,
                    ),
                  ),
                );
              },
              child: Icon(Icons.add),
              backgroundColor: Colors.red,
            )
          : null,
      floatingActionButtonLocation: widget.isReport == false
          ? FloatingActionButtonLocation.endDocked
          : null,
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
        fabLocation:
            widget.isReport == false ? BubbleBottomBarFabLocation.end : null,
        elevation: 8,
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
