import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:student_internships_management/models/Report.dart';
import 'package:student_internships_management/views/ReportDetail/CreateOrEditReport.dart';
import 'package:student_internships_management/views/ReportDetail/ReportDetail.dart';

class CardReport extends StatefulWidget {
  final Report report;
  final List<Report> listView;
  final int index;
  final Function(VoidCallback fn) setState;

  const CardReport(
      {Key key,
      @required this.report,
      @required this.listView,
      @required this.index,
      @required this.setState})
      : super(key: key);

  @override
  _CardReportState createState() => _CardReportState();
}

class _CardReportState extends State<CardReport>
    with SingleTickerProviderStateMixin {
  Animation animation, delayedAnimation;
  AnimationController animationController;

  @override
  void initState() {
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
    var ngayBaoCao = widget.report != null
        ? DateFormat("dd/MM/yyyy").format(widget?.report?.ngayBaoCao)
        : DateTime.now();

    return AnimatedBuilder(
      animation: animationController,
      builder: (BuildContext context, Widget child) {
        return GestureDetector(
          child: Container(
            padding: const EdgeInsets.all(8),
            child: Padding(
              padding: const EdgeInsets.only(top: 8.0),
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
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${ngayBaoCao}",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "${widget?.report?.deTai}",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: 60,
                              child: Center(
                                child: SizedBox.fromSize(
                                  size: Size(46, 46), // button width and height
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
                                                  CreateOrEditReport(
                                                report: widget.report,
                                                listView: widget.listView,
                                                index: widget.index,
                                                setStateView: widget.setState,
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
                                  size: Size(46, 46), // button width and height
                                  child: ClipOval(
                                    child: Material(
                                      child: ElevatedButton(
                                        style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStateProperty.all(Colors
                                                  .redAccent), // button color
                                        ),
                                        onPressed: () {
                                          Report tempReport =
                                              new Report.cloneByObject(
                                                  widget.report);

                                          widget.setState(() {
                                            widget.listView
                                                .removeAt(widget.index);
                                          });
                                          final snackBar = SnackBar(
                                            content:
                                                const Text('Đã xoá thành công'),
                                            action: SnackBarAction(
                                              label: 'Khôi phục',
                                              onPressed: () {
                                                widget.setState(() {
                                                  widget.listView
                                                      .add(tempReport);
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
                          ]),
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
                builder: (context) => ReportDetail(
                  report: widget.report,
                  index: widget.index,
                  listView: widget.listView,
                  setState: widget.setState,
                ),
              ),
            );
          },
        );
      },
    );
  }
}
