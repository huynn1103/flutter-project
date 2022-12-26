import 'package:bubble_bottom_bar/bubble_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student_internships_management/models/Report.dart';
import 'package:student_internships_management/models/Student.dart';
import 'package:student_internships_management/providers/ReportProvider.dart';
import 'package:student_internships_management/views/ListStudent/WrapperList.dart';
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
    var reportProvider = Provider.of<ReportProvider>(
      context,
      listen: false,
    );
    if (widget.student.id != null) {
      reportProvider.findAll(widget.student.id).then((value) {
        setState(() {
          listReport = value;
        });
      });
    } else {
      reportProvider.findAll('0').then((value) {
        setState(() {
          listReport = value;
        });
      });
    }
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
          setState(() {
            _bottomNavIndex = index;
          });
          if (index == 0) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => WrapperList(
                  classroomId: widget.student.lopHocPhan.id,
                  departmentId: widget.student.lopHocPhan.khoa.id,
                  tabViewIndex: 1,
                ),
              ),
            );
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
