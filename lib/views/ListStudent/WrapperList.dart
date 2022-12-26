import 'package:flutter/material.dart';
import 'package:student_internships_management/views/ListStudent/ListInternship.dart';
import 'package:student_internships_management/widgets/App/AppBar.dart';
import 'package:student_internships_management/widgets/App/AppCardDetail.dart';
import 'package:student_internships_management/widgets/App/MainDrawer.dart';

class WrapperList extends StatefulWidget {
  final String classroomId;
  final String departmentId;
  final int tabViewIndex;

  const WrapperList({
    Key key,
    this.classroomId,
    this.departmentId,
    this.tabViewIndex,
  }) : super(key: key);

  @override
  _WrapperListState createState() => _WrapperListState();
}

class _WrapperListState extends State<WrapperList>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _scaffoldKey =
        new GlobalKey<ScaffoldState>();
    return Scaffold(
      key: _scaffoldKey,
      appBar: CommonAppBar(
        title: "Đại Học Khoa Học Huế",
        menuenabled: true,
        notificationenabled: true,
        ontap: () {
          _scaffoldKey.currentState.openDrawer();
        },
      ),
      drawer: Drawer(
        elevation: 0,
        child: MainDrawer(),
      ),
      body: SingleChildScrollView(
        child: Column(
          //crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            AppCardDetail(
              classroomId: widget.classroomId,
              departmentId: widget.departmentId,
            ),
            DefaultTabController(
              length: 2, // length of tabs
              initialIndex: widget.tabViewIndex,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                    ),
                    child: Container(
                      child: TabBar(
                        labelColor: Colors.black,
                        unselectedLabelColor: Colors.black26,
                        indicatorColor: Colors.black,
                        tabs: [
                          Tab(text: 'Danh sách sinh viên'),
                          Tab(text: 'Danh sách báo cáo'),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height *
                        0.68, //height of TabBarView
                    padding: EdgeInsets.symmetric(
                      horizontal: 10,
                    ),
                    child: TabBarView(
                      children: <Widget>[
                        ListInternship(
                          isReport: false,
                          classroomId: widget.classroomId,
                          departmentId: widget.departmentId,
                        ),
                        ListInternship(
                          isReport: true,
                          classroomId: widget.classroomId,
                          departmentId: widget.departmentId,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
