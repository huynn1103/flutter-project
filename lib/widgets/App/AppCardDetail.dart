import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student_internships_management/providers/ClassroomProvider.dart';
import 'package:student_internships_management/providers/DepartmentProvider.dart';

class AppCardDetail extends StatefulWidget {
  final String classroomId;
  final String departmentId;

  const AppCardDetail({
    Key key,
    this.classroomId,
    this.departmentId,
  }) : super(key: key);

  @override
  _AppCardDetailState createState() => _AppCardDetailState();
}

class _AppCardDetailState extends State<AppCardDetail>
    with SingleTickerProviderStateMixin {
  Animation animation, delayedAnimation, muchDelayedAnimation, LeftCurve;
  AnimationController animationController;

  String departmentName = '';
  String classroomName = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    var departmentProvider = Provider.of<DepartmentProvider>(
      context,
      listen: false,
    );
    if (widget.departmentId != null) {
      departmentProvider.findOne(widget.departmentId).then((value) {
        setState(() {
          departmentName = 'Khoa ${value.tenKhoa}';
        });
      });
    }

    var classroomProvider = Provider.of<ClassroomProvider>(
      context,
      listen: false,
    );
    if (widget.classroomId != null) {
      classroomProvider.findOne(widget.classroomId).then((value) {
        setState(() {
          classroomName = value.tenLop.substring(value.tenLop.length - 6);
        });
      });
    }

    animationController =
        AnimationController(duration: Duration(seconds: 2), vsync: this);
    animation = Tween(begin: -1.0, end: 0.0).animate(CurvedAnimation(
        parent: animationController, curve: Curves.fastOutSlowIn));

    delayedAnimation = Tween(begin: 1.0, end: 0.0).animate(CurvedAnimation(
        parent: animationController,
        curve: Interval(0.2, 0.5, curve: Curves.fastOutSlowIn)));

    muchDelayedAnimation = Tween(begin: -1.0, end: 0.0).animate(CurvedAnimation(
        parent: animationController,
        curve: Interval(0.2, 0.5, curve: Curves.fastOutSlowIn)));
  }

  @override
  void dispose() {
    // TODO: implement dispose
    animationController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    animationController.forward();
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    return AnimatedBuilder(
      animation: animationController,
      builder: (BuildContext context, Widget child) {
        return Padding(
          padding: const EdgeInsets.fromLTRB(10.0, 5, 10, 3),
          child: Container(
            alignment: Alignment(0, 0),
            child: Padding(
              padding: const EdgeInsets.only(top: 10.0, right: 0.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(5),
                ),
                height: height * 0.17,
                width: double.infinity,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(15.0, 10, 0, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Transform(
                            transform: Matrix4.translationValues(
                                muchDelayedAnimation.value * width, 0, 0),
                            child: Center(
                              child: CircleAvatar(
                                radius: 35,
                                backgroundImage: AssetImage("assets/home.png"),
                              ),
                            ),
                          ),
                          Transform(
                            transform: Matrix4.translationValues(
                                delayedAnimation.value * width, 0, 0),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 15.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 8.0),
                                    child: Container(
                                      padding: EdgeInsets.fromLTRB(5, 2, 5, 2),
                                      decoration: BoxDecoration(
                                        color: Colors.orange[50],
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Text(
                                        "Khoá K43",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14,
                                          color: Colors.deepOrange,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 10.0),
                                    child: Text(
                                      departmentName,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    classroomName,
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 50,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
