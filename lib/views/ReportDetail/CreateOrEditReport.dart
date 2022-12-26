import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student_internships_management/models/Report.dart';
import 'package:student_internships_management/models/Student.dart';
import 'package:student_internships_management/providers/ReportProvider.dart';
import 'package:student_internships_management/views/ListReport/WrapListReport.dart';
import 'package:student_internships_management/widgets/App/AppBar.dart';
import 'package:student_internships_management/widgets/App/BouncingButton.dart';
import 'package:student_internships_management/widgets/App/MainDrawer.dart';

class CreateOrEditReport extends StatefulWidget {
  final Student student;
  final Report report;

  const CreateOrEditReport({
    Key key,
    this.report,
    this.student,
  }) : super(key: key);

  @override
  _CreateOrEditReportState createState() => _CreateOrEditReportState();
}

class _CreateOrEditReportState extends State<CreateOrEditReport>
    with SingleTickerProviderStateMixin {
  Animation animation, delayedAnimation, muchDelayedAnimation;
  AnimationController animationController;

  Report report;
  TextEditingController searchFieldController = TextEditingController();
  TextEditingController conDeTai = TextEditingController();
  TextEditingController conNoiDung = TextEditingController();
  TextEditingController conNgayBaoCao = TextEditingController();
  String conNgayBaoCaoChanged = '';

  @override
  void initState() {
    super.initState();

    if (widget.report != null) {
      conDeTai.text = widget.report.deTai;
      conNoiDung.text = widget.report.noiDung;
      conNgayBaoCao.text = widget.report.ngayBaoCao.toString();
    }

    animationController =
        AnimationController(duration: Duration(seconds: 3), vsync: this);
    animation = Tween(begin: -1.0, end: 0.0).animate(CurvedAnimation(
        parent: animationController, curve: Curves.fastOutSlowIn));

    delayedAnimation = Tween(begin: 1.0, end: 0.0).animate(CurvedAnimation(
        parent: animationController,
        curve: Interval(0.2, 0.5, curve: Curves.fastOutSlowIn)));

    muchDelayedAnimation = Tween(begin: -1.0, end: 0.0).animate(CurvedAnimation(
        parent: animationController,
        curve: Interval(0.3, 0.5, curve: Curves.fastOutSlowIn)));
  }

  @override
  void dispose() {
    // TODO: implement dispose
    animationController.dispose();
    conNoiDung.dispose();
    conNgayBaoCao.dispose();
    conDeTai.dispose();

    super.dispose();
  }

  final GlobalKey<FormState> _formkey = new GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    animationController.forward();
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;

    final GlobalKey<ScaffoldState> _scaffoldKey =
        new GlobalKey<ScaffoldState>();

    return AnimatedBuilder(
      animation: animationController,
      builder: (BuildContext context, Widget child) {
        final GlobalKey<ScaffoldState> _scaffoldKey =
            new GlobalKey<ScaffoldState>();
        return Scaffold(
          key: _scaffoldKey,
          appBar: CommonAppBar(
            menuenabled: true,
            notificationenabled: false,
            title: widget.report != null
                ? "Cập nhật báo cáo sinh viên"
                : "Thêm mới báo cáo sinh viên",
            ontap: () {
              _scaffoldKey.currentState.openDrawer();
            },
          ),
          drawer: Drawer(
            elevation: 0,
            child: MainDrawer(),
          ),
          body: Form(
            key: _formkey,
            child: SingleChildScrollView(
              physics: AlwaysScrollableScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 15.0,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: height * 0.05,
                    ),
                    Transform(
                      transform: Matrix4.translationValues(
                          muchDelayedAnimation.value * width, 0, 0),
                      child: Text(
                        "Đề tài *",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: height * 0.02,
                    ),
                    Transform(
                      transform: Matrix4.translationValues(
                          delayedAnimation.value * width, 0, 0),
                      child: Padding(
                        padding: EdgeInsets.only(
                          top: 13,
                        ),
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: TextFormField(
                            controller: conDeTai,
                            minLines: 1,
                            enabled: widget.report == null,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Vui lòng nhập tên đề tài';
                              }
                              return null;
                            },
                            autofocus: false,
                            decoration: const InputDecoration(
                              hintText: 'Nhập vào tên đề tài',
                              border: UnderlineInputBorder(),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: height * 0.05,
                    ),
                    Transform(
                      transform: Matrix4.translationValues(
                          muchDelayedAnimation.value * width, 0, 0),
                      child: Text(
                        "Ngày báo cáo *",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        top: 13,
                      ),
                      child: Container(
                        // height: height * 0.06,
                        padding: EdgeInsets.only(
                          left: 10,
                        ),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Row(
                          children: [
                            Transform(
                              transform: Matrix4.translationValues(
                                  muchDelayedAnimation.value * width, 0, 0),
                              child: Container(
                                width: width * 0.2,
                                child: DateTimePicker(
                                  autofocus: false,
                                  type: DateTimePickerType.date,
                                  dateMask: 'dd/MM/yyyy',
                                  controller: conNgayBaoCao,
                                  firstDate: DateTime(2000),
                                  lastDate: DateTime(2100),
                                  calendarTitle: "Ngày báo cáo",
                                  confirmText: "CONFIRM",
                                  enableSuggestions: true,
                                  validator: (selectedValue) {
                                    if (selectedValue == null) {
                                      return 'Vui lòng chọn ngày báo cáo';
                                    }
                                    return null;
                                  },
                                  onChanged: (String val) => {
                                    setState(() => conNgayBaoCao.text = val),
                                  },
                                ),
                              ),
                            ),
                            Transform(
                              transform: Matrix4.translationValues(
                                  delayedAnimation.value * width, 0, 0),
                              child: Icon(
                                Icons.calendar_today,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Divider(
                      color: Colors.black.withOpacity(0.5),
                      height: 1,
                    ),
                    SizedBox(
                      height: height * 0.03,
                    ),
                    Transform(
                      transform: Matrix4.translationValues(
                          muchDelayedAnimation.value * width, 0, 0),
                      child: Text(
                        "Nội dung *",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: height * 0.02,
                    ),
                    Transform(
                      transform: Matrix4.translationValues(
                          delayedAnimation.value * width, 0, 0),
                      child: Padding(
                        padding: EdgeInsets.only(
                          top: 13,
                        ),
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: TextFormField(
                            minLines: 1,
                            maxLines: 10,
                            controller: conNoiDung,
                            keyboardType: TextInputType.multiline,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Vui lòng nhập nội dung báo cáo';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              hintText: 'Nhập vào nội dung báo cáo',
                              border: UnderlineInputBorder(),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Divider(
                      color: Colors.black.withOpacity(0.5),
                      height: 1,
                    ),
                    SizedBox(
                      height: height * 0.05,
                    ),
                    Transform(
                      transform: Matrix4.translationValues(
                          delayedAnimation.value * width, 0, 0),
                      child: BouncingButton(
                        onPress: () async {
                          if (_formkey.currentState.validate()) {
                            String reportId = '0';
                            if (widget.report != null) {
                              reportId = widget.report.id;
                            }
                            Report newReport = new Report(
                              id: reportId,
                              student: widget.student,
                              deTai: conDeTai.text,
                              noiDung: conNoiDung.text,
                              ngayBaoCao: DateTime.parse(conNgayBaoCao.text),
                            );

                            var reportProvider = Provider.of<ReportProvider>(
                              context,
                              listen: false,
                            );

                            await reportProvider.createOrUpdate(newReport);

                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => WrapListReport(
                                  student: widget.student,
                                ),
                              ),
                            );
                          }
                        },
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.blue,
                          ),
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: widget.report != null
                                  ? Text(
                                      "Cập nhật",
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    )
                                  : Text(
                                      "Thêm mới",
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                            ),
                          ),
                        ),
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
