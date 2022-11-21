import 'package:bubble_bottom_bar/bubble_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:student_internships_management/data/dummyData.dart';
import 'package:student_internships_management/models/Report.dart';
import 'package:student_internships_management/models/Student.dart';
import 'package:student_internships_management/views/ReportDetail/CreateOrEditReport.dart';
import 'package:student_internships_management/widgets/Report/CartReport.dart';

class ListReportInternship extends StatefulWidget {
  final Student student;

  const ListReportInternship({Key key, this.student}) : super(key: key);

  @override
  _ListReportInternshipState createState() => _ListReportInternshipState();
}

class _ListReportInternshipState extends State<ListReportInternship> {
  Student _student;
  List<Report> listReport = [];

  @override
  void initState() {
    super.initState();
    _student = widget.student;
    reports.map((e) {
      if (e.student.maSinhVien == _student.maSinhVien) {
        listReport.add(e);
      }
    }).toList();
  }

  int _bottomNavIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: listReport.isEmpty
          ? Center(
              child: Text(
              'Danh sách báo cáo trống',
              style: TextStyle(fontSize: 18),
            ))
          : ListView.builder(
              itemCount: listReport.length,
              padding: EdgeInsets.only(bottom: 20),
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  child: CardReport(
                    report: listReport[index],
                    listView: listReport,
                    index: index,
                    setState: setState,
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CreateOrEditReport(
                student: widget.student,
                deTai: listReport.length > 0 ? listReport[0]?.deTai : null,
              ),
            ),
          );
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.red,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
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
        elevation: 8,
        fabLocation: BubbleBottomBarFabLocation.end,
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
