import 'package:bubble_bottom_bar/bubble_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student_internships_management/models/Student.dart';
import 'package:student_internships_management/providers/StudentProvider.dart';
import 'package:student_internships_management/views/ListClassroom/WrapListClassroom.dart';
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
        setState(() {
          students = value;
          listStudent = value;
        });
      });
    } else {
      studentProvider.findAll('1').then((value) {
        value.map((e) => listStudent.add(e)).toList();
        setState(() {
          students = value;
          listStudent = value;
        });
      });
    }
  }

  void filterSearchResults(String querySearch) {
    if (querySearch.isNotEmpty) {
      List<Student> listStudentSearch = [];
      students.forEach((item) {
        if (item.tenSinhVien
            .toLowerCase()
            .contains(querySearch.toLowerCase().trim())) {
          listStudentSearch.add(item);
        }
      });
      setState(() {
        listStudent = listStudentSearch;
      });
    } else {
      setState(() {
        listStudent = students;
      });
    }

    return;
  }

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
                      filterSearchResults(value);
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
          setState(() {
            _bottomNavIndex = index;
          });
          if (index == 0) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => WrapListClassroom(
                  departmentId: widget.departmentId,
                ),
              ),
            );
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
