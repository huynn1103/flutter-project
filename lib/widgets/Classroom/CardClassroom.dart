import 'package:flutter/material.dart';
import 'package:student_internships_management/models/Classroom.dart';
import 'package:student_internships_management/views/ListStudent/WrapperList.dart';

class CardClassroom extends StatefulWidget {
  final Classroom classroom;

  const CardClassroom({
    Key key,
    this.classroom,
  }) : super(key: key);

  @override
  _CardClassroomState createState() => _CardClassroomState();
}

class _CardClassroomState extends State<CardClassroom>
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
        curve: Interval(0.2, 0.6, curve: Curves.fastOutSlowIn)));
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
            padding: const EdgeInsets.all(4),
            child: Padding(
              padding: const EdgeInsets.only(top: 3.0),
              child: Transform(
                transform: Matrix4.translationValues(
                  delayedAnimation.value * width,
                  0,
                  0,
                ),
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
                      ),
                    ],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${widget.classroom.tenLop}",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Giảng viên: ${widget.classroom.giangVien.tenGiangVien}",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
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
                builder: (context) => WrapperList(
                  classroomId: widget.classroom.id,
                  departmentId: widget.classroom.khoa.id,
                  tabViewIndex: 0,
                ),
              ),
            );
          },
        );
      },
    );
  }
}
