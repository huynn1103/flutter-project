import 'package:flutter/material.dart';
import 'package:student_internships_management/models/Student.dart';
import 'package:student_internships_management/views/ListReport/ListReport.dart';
import 'package:student_internships_management/views/ListReport/WrapListReport.dart';
import 'package:student_internships_management/views/StudentDetail/CreateOrEditStudent.dart';
import 'package:student_internships_management/views/StudentDetail/StudentDetail.dart';

class CardStudent extends StatefulWidget {
  final Student student;
  final List<Student> listView;
  final int index;
  final Function(VoidCallback fn) setState;
  final bool isReport;

  const CardStudent(
      {Key key,
      this.student,
      this.listView,
      this.index,
      this.setState,
      this.isReport})
      : super(key: key);

  @override
  _CardStudentState createState() => _CardStudentState();
}

class _CardStudentState extends State<CardStudent>
    with SingleTickerProviderStateMixin {
  Animation animation, delayedAnimation;
  AnimationController animationController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    animationController =
        AnimationController(duration: Duration(seconds: 3), vsync: this);
    animation = Tween(begin: -1.0, end: 0.0).animate(CurvedAnimation(
        parent: animationController, curve: Curves.fastOutSlowIn));

    delayedAnimation = Tween(begin: 1.0, end: 0.0).animate(CurvedAnimation(
        parent: animationController,
        curve: Interval(0.3, 0.7, curve: Curves.fastOutSlowIn)));
  }

  @override
  void dispose() {
    // TODO: implement dispose
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    animationController.forward();

    return AnimatedBuilder(
      animation: animationController,
      builder: (BuildContext context, Widget child) {
        return GestureDetector(
          child: Container(
            child: Padding(
              padding: const EdgeInsets.only(top: 9.0),
              child: Transform(
                transform: Matrix4.translationValues(
                    delayedAnimation.value * width, 0, 0),
                child: Container(
                  padding: EdgeInsets.symmetric(
                    vertical: 13,
                    horizontal: 20,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white70,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        offset: Offset(0, 3),
                        //blurRadius: 3,
                        //spreadRadius: 1,
                      ),
                    ],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${widget.student.tenSinhVien}",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          SizedBox(
                            height: 14,
                          ),
                          widget.isReport == false
                              ? Text(
                                  "${widget.student.chuyenNganh}",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 13,
                                  ),
                                )
                              : Text(
                                  "${widget.student.noiThucTap}",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 13,
                                  ),
                                ),
                        ],
                      ),
                      widget.isReport == false
                          ? Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                  Container(
                                    width: 60,
                                    child: Center(
                                      child: SizedBox.fromSize(
                                        size: Size(
                                            46, 46), // button width and height
                                        child: ClipOval(
                                          child: Material(
                                            color: Colors.lightBlueAccent,
                                            // button color
                                            child: InkWell(
                                              splashColor: Colors.white,
                                              // splash color
                                              onTap: () {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        CreateOrEditStudent(
                                                      student: widget.student,
                                                      listView: widget.listView,
                                                      index: widget.index,
                                                      setStateView:
                                                          widget.setState,
                                                    ),
                                                  ),
                                                );
                                              },
                                              // button pressed
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: <Widget>[
                                                  Icon(
                                                    Icons.create_outlined,
                                                    size: 20,
                                                  ),
                                                  // icon
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Container(
                                    child: Center(
                                      child: SizedBox.fromSize(
                                        size: Size(
                                            46, 46), // button width and height
                                        child: ClipOval(
                                          child: Material(
                                            child: ElevatedButton(
                                              style: ButtonStyle(
                                                backgroundColor:
                                                    MaterialStateProperty.all(Colors
                                                        .redAccent), // button color
                                              ),
                                              onPressed: () {
                                                Student tempStudent =
                                                    new Student.cloneByObject(
                                                        widget.student);
                                                widget.setState(() {
                                                  widget.listView
                                                      .removeAt(widget.index);
                                                });
                                                final snackBar = SnackBar(
                                                  content: const Text(
                                                      'Đã xoá thành công'),
                                                  action: SnackBarAction(
                                                    label: 'Khôi phục',
                                                    onPressed: () {
                                                      widget.setState(() {
                                                        widget.listView
                                                            .add(tempStudent);
                                                      });
                                                    },
                                                  ),
                                                );
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(snackBar);
                                              },
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: <Widget>[
                                                  Icon(
                                                    Icons.auto_delete_outlined,
                                                    size: 20,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ])
                          : Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "${widget.student.tenSinhVien}",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 30,
                                    )
                                  ],
                                ),
                              ],
                            ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => widget.isReport == false
                    ? StudentDetail(
                        student: widget.student,
                      )
                    : WrapListReport(
                        student: widget.student,
                      ),
              ),
            );
          },
        );
      },
    );
  }
}
