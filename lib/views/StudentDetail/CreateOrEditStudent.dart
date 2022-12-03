import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:student_internships_management/data/dummyData.dart';
import 'package:student_internships_management/models/Classroom.dart';
import 'package:student_internships_management/models/Student.dart';
import 'package:student_internships_management/models/Teacher.dart';
import 'package:student_internships_management/views/ListStudent/WrapperList.dart';
import 'package:student_internships_management/widgets/App/AppBar.dart';
import 'package:student_internships_management/widgets/App/BouncingButton.dart';
import 'package:student_internships_management/widgets/App/MainDrawer.dart';

class CreateOrEditStudent extends StatefulWidget {
  final Student student;
  final List<Student> listView;
  final int index;
  final Function(VoidCallback fn) setStateView;

  const CreateOrEditStudent(
      {Key key, this.student, this.listView, this.index, this.setStateView})
      : super(key: key);

  @override
  _CreateOrEditStudentState createState() => _CreateOrEditStudentState();
}

class _CreateOrEditStudentState extends State<CreateOrEditStudent>
    with SingleTickerProviderStateMixin {
  String conChuyenNganh, conNoiThucTap, conGiangVien, conLopHocPhan;
  Animation animation, delayedAnimation, muchDelayedAnimation, LeftCurve;
  AnimationController animationController;

  Student student;

  TextEditingController conMaSinhVien = TextEditingController();
  TextEditingController conTenSinhVien = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    student = widget.student;

    conMaSinhVien.text = student?.maSinhVien;
    conTenSinhVien.text = student?.tenSinhVien;

    conChuyenNganh = student?.chuyenNganh;
    conNoiThucTap = student?.noiThucTap;
    conGiangVien = student?.giangVienHuongDan;
    conLopHocPhan = student?.lopHocPhan?.tenLop;

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
    conMaSinhVien.dispose();
    conTenSinhVien.dispose();
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
            title: widget.student != null
                ? "Cập nhật sinh viên"
                : "Thêm mới sinh viên",
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
                        "Mã Sinh Viên *",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
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
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Vui lòng nhập mã sinh viên';
                              }
                              return null;
                            },
                            controller: conMaSinhVien,
                            minLines: 1,
                            autofocus: false,
                            decoration: const InputDecoration(
                              hintText: 'Nhập vào mã sinh viên',
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
                        "Tên sinh viên *",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
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
                            controller: conTenSinhVien,
                            minLines: 1,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Vui lòng nhập tên sinh viên';
                              }
                              return null;
                            },
                            decoration: const InputDecoration(
                              hintText: 'Nhập vào tên sinh viên',
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
                        "Lớp học phần *",
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 14,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: height * 0.02,
                    ),
                    Transform(
                      transform: Matrix4.translationValues(
                          delayedAnimation.value * width, 0, 0),
                      child: DropdownSearch<String>(
                        validator: (selectedValue) {
                          if (selectedValue == null) {
                            return 'Vui lòng chọn lớp';
                          }
                          return null;
                        },
                        showClearButton: true,
                        mode: Mode.MENU,
                        items: classes?.map((e) => e.tenLop)?.toList() ?? [],
                        onChanged: (String item) => {
                          setState(() {
                            conLopHocPhan = item;
                          }),
                        },
                        selectedItem: widget.student != null
                            ? widget?.student?.lopHocPhan?.tenLop
                            : null,
                      ),
                    ),
                    SizedBox(
                      height: height * 0.05,
                    ),
                    Transform(
                      transform: Matrix4.translationValues(
                          muchDelayedAnimation.value * width, 0, 0),
                      child: Text(
                        "Chuyên ngành *",
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 14,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: height * 0.02,
                    ),
                    Transform(
                      transform: Matrix4.translationValues(
                          delayedAnimation.value * width, 0, 0),
                      child: DropdownSearch<String>(
                        validator: (selectedValue) {
                          if (selectedValue == null) {
                            return 'Vui lòng chọn chuyên ngành';
                          }
                          return null;
                        },
                        showClearButton: true,
                        mode: Mode.MENU,
                        items: majors.map((e) => e.tenChuyenNganh).toList(),
                        onChanged: (String item) => {
                          setState(() {
                            conChuyenNganh = item;
                          }),
                        },
                        selectedItem: widget.student != null
                            ? widget.student.chuyenNganh
                            : null,
                      ),
                    ),
                    SizedBox(
                      height: height * 0.05,
                    ),
                    Transform(
                      transform: Matrix4.translationValues(
                          muchDelayedAnimation.value * width, 0, 0),
                      child: Text(
                        "Giảng viên hướng dẫn *",
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 14,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: height * 0.02,
                    ),
                    Transform(
                      transform: Matrix4.translationValues(
                          delayedAnimation.value * width, 0, 0),
                      child: DropdownSearch<String>(
                        validator: (String item) {
                          if (item.isEmpty)
                            return "Required field";
                          else
                            return null; //return null to "no error"
                        },
                        showSearchBox: true,
                        showClearButton: true,
                        mode: Mode.MENU,
                        items: teachers.map((e) => e.tenGiangVien).toList(),
                        onChanged: (String item) => {
                          setState(() {
                            conGiangVien = item;
                          }),
                        },
                        selectedItem: widget.student != null
                            ? widget.student.giangVienHuongDan
                            : null,
                      ),
                    ),
                    SizedBox(
                      height: height * 0.05,
                    ),
                    Transform(
                      transform: Matrix4.translationValues(
                          muchDelayedAnimation.value * width, 0, 0),
                      child: Text(
                        "Nơi thực tập *",
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 14,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: height * 0.02,
                    ),
                    Transform(
                      transform: Matrix4.translationValues(
                          delayedAnimation.value * width, 0, 0),
                      child: DropdownSearch<String>(
                        showSearchBox: true,
                        showClearButton: true,
                        mode: Mode.DIALOG,
                        validator: (selectedValue) {
                          if (selectedValue == null) {
                            return 'Vui lòng chọn nơi thực tập';
                          }
                          return null;
                        },
                        items: companies.map((e) => e.tenDoanhNghiep).toList(),
                        onChanged: (String item) => {
                          setState(() {
                            conNoiThucTap = item;
                          }),
                        },
                        selectedItem: widget.student != null
                            ? widget.student.noiThucTap
                            : null,
                      ),
                    ),
                    SizedBox(
                      height: height * 0.02,
                    ),
                    Transform(
                      transform: Matrix4.translationValues(
                          delayedAnimation.value * width, 0, 0),
                      child: BouncingButton(
                        onPress: () {
                          if (_formkey.currentState.validate()) {
                            final maSinhVien = conMaSinhVien.text;
                            final tenSinhVien = conTenSinhVien.text;
                            final chuyenNganh = conChuyenNganh;
                            final giaoVienHuongDan = conGiangVien;
                            final noiThucTap = conNoiThucTap;
                            final tenLop = conLopHocPhan;

                            Teacher teacher = new Teacher(
                              tenGiangVien: giaoVienHuongDan,
                              khoa: departments[1],
                            );

                            Classroom classroom = new Classroom(
                              tenLop: tenLop,
                              soLuong: 10,
                              khoa: departments[1],
                              giangVien: teacher,
                            );

                            Student newStudent = new Student(
                              maSinhVien: maSinhVien,
                              tenSinhVien: tenSinhVien,
                              chuyenNganh: chuyenNganh,
                              giangVienHuongDan: giaoVienHuongDan,
                              noiThucTap: noiThucTap,
                              lopHocPhan: classroom,
                            );

                            if (widget.setStateView == null) {
                              students.add(newStudent);
                            } else {
                              widget.setStateView(() {
                                widget.listView[widget.index].setMaSinhVien =
                                    newStudent.maSinhVien;
                                widget.listView[widget.index].setTenSinhVien =
                                    newStudent.tenSinhVien;
                                widget.listView[widget.index].setNoiThucTap =
                                    newStudent.noiThucTap;
                                widget.listView[widget.index].setChuyenNganh =
                                    newStudent.chuyenNganh;
                                widget.listView[widget.index].setGiangVien =
                                    newStudent.giangVienHuongDan;
                                widget.listView[widget.index].setLop =
                                    newStudent.lopHocPhan;
                              });
                            }

                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => WrapperList(),
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
                              child: widget.student != null
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
                    SizedBox(
                      height: 20,
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
