import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student_internships_management/models/Classroom.dart';
import 'package:student_internships_management/models/Company.dart';
import 'package:student_internships_management/models/Major.dart';
import 'package:student_internships_management/models/Student.dart';
import 'package:student_internships_management/models/Teacher.dart';
import 'package:student_internships_management/providers/ClassroomProvider.dart';
import 'package:student_internships_management/providers/CompanyProvider.dart';
import 'package:student_internships_management/providers/MajorProvider.dart';
import 'package:student_internships_management/providers/StudentProvider.dart';
import 'package:student_internships_management/providers/TeacherProvider.dart';
import 'package:student_internships_management/views/ListStudent/WrapperList.dart';
import 'package:student_internships_management/widgets/App/AppBar.dart';
import 'package:student_internships_management/widgets/App/BouncingButton.dart';
import 'package:student_internships_management/widgets/App/MainDrawer.dart';

class CreateOrEditStudent extends StatefulWidget {
  final Student student;
  final String classroomId;
  final String departmentId;

  const CreateOrEditStudent({
    Key key,
    this.student,
    this.classroomId,
    this.departmentId,
  }) : super(key: key);

  @override
  _CreateOrEditStudentState createState() => _CreateOrEditStudentState();
}

class _CreateOrEditStudentState extends State<CreateOrEditStudent>
    with SingleTickerProviderStateMixin {
  Classroom conLopHocPhan;
  Company conNoiThucTap;
  Major conChuyenNganh;
  Teacher conGiangVien;
  Animation animation, delayedAnimation, muchDelayedAnimation, LeftCurve;
  AnimationController animationController;

  Student student;
  List<Classroom> classes = [];
  List<Company> companies = [];
  List<Major> majors = [];
  List<Teacher> teachers = [];

  TextEditingController conMaSinhVien = TextEditingController();
  TextEditingController conTenSinhVien = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    var classroomProvider = Provider.of<ClassroomProvider>(
      context,
      listen: false,
    );
    classroomProvider.findAll(widget.departmentId).then((value) {
      conLopHocPhan =
          value.firstWhere((element) => element.id == widget.classroomId);
      setState(() {
        classes = value;
      });
    });

    var companyProvider = Provider.of<CompanyProvider>(
      context,
      listen: false,
    );
    companyProvider.findAll().then((value) {
      if (widget.student != null) {
        conNoiThucTap = value.firstWhere(
            (element) => element.id == widget.student.noiThucTap.id);
      }
      setState(() {
        companies = value;
      });
    });

    var majorProvider = Provider.of<MajorProvider>(
      context,
      listen: false,
    );
    majorProvider.findAll(widget.departmentId).then((value) {
      if (widget.student != null) {
        conChuyenNganh = value.firstWhere(
            (element) => element.id == widget.student.chuyenNganh.id);
      }
      setState(() {
        majors = value;
      });
    });

    var teacherProvider = Provider.of<TeacherProvider>(
      context,
      listen: false,
    );
    teacherProvider.findAll(widget.departmentId).then((value) {
      if (widget.student != null) {
        conGiangVien = value.firstWhere(
            (element) => element.id == widget.student.giangVienHuongDan.id);
      }
      setState(() {
        teachers = value;
      });
    });

    student = widget.student;

    conMaSinhVien.text = student?.maSinhVien;
    conTenSinhVien.text = student?.tenSinhVien;

    conChuyenNganh = student?.chuyenNganh;
    conNoiThucTap = student?.noiThucTap;
    conGiangVien = student?.giangVienHuongDan;
    conLopHocPhan = student?.lopHocPhan;

    animationController = AnimationController(
      duration: Duration(seconds: 3),
      vsync: this,
    );
    animation = Tween(begin: -1.0, end: 0.0).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Curves.fastOutSlowIn,
      ),
    );

    delayedAnimation = Tween(begin: 1.0, end: 0.0).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Interval(0.2, 0.5, curve: Curves.fastOutSlowIn),
      ),
    );

    muchDelayedAnimation = Tween(begin: -1.0, end: 0.0).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Interval(0.3, 0.5, curve: Curves.fastOutSlowIn),
      ),
    );
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
                            enabled: widget.student == null,
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
                            enabled: widget.student == null,
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
                        delayedAnimation.value * width,
                        0,
                        0,
                      ),
                      child: DropdownSearch<Classroom>(
                        enabled: false,
                        validator: (selectedValue) {
                          if (selectedValue == null) {
                            return 'Vui lòng chọn lớp';
                          }
                          return null;
                        },
                        mode: Mode.MENU,
                        items: classes,
                        itemAsString: (Classroom item) => item.tenLop,
                        onChanged: (Classroom item) => {
                          setState(() {
                            conLopHocPhan = item;
                          }),
                        },
                        selectedItem: conLopHocPhan,
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
                      child: DropdownSearch<Major>(
                        validator: (selectedValue) {
                          if (selectedValue == null) {
                            return 'Vui lòng chọn chuyên ngành';
                          }
                          return null;
                        },
                        showClearButton: true,
                        mode: Mode.MENU,
                        items: majors,
                        itemAsString: (Major item) => item.tenChuyenNganh,
                        onChanged: (Major item) => {
                          setState(() {
                            conChuyenNganh = item;
                          }),
                        },
                        selectedItem: conChuyenNganh,
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
                      child: DropdownSearch<Teacher>(
                        validator: (selectedValue) {
                          if (selectedValue == null) {
                            return 'Vui lòng chọn giảng viên hướng dẫn';
                          }
                          return null;
                        },
                        showClearButton: true,
                        mode: Mode.MENU,
                        items: teachers,
                        itemAsString: (Teacher item) => item.tenGiangVien,
                        onChanged: (Teacher item) => {
                          setState(() {
                            conGiangVien = item;
                          }),
                        },
                        selectedItem: conGiangVien,
                      ),
                    ),
                    SizedBox(
                      height: height * 0.05,
                    ),
                    Transform(
                      transform: Matrix4.translationValues(
                        muchDelayedAnimation.value * width,
                        0,
                        0,
                      ),
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
                      child: DropdownSearch<Company>(
                        showClearButton: true,
                        mode: Mode.MENU,
                        validator: (selectedValue) {
                          if (selectedValue == null) {
                            return 'Vui lòng chọn nơi thực tập';
                          }
                          return null;
                        },
                        items: companies,
                        itemAsString: (Company item) => item.tenDoanhNghiep,
                        onChanged: (Company item) => {
                          setState(() {
                            conNoiThucTap = item;
                          }),
                        },
                        selectedItem: conNoiThucTap,
                      ),
                    ),
                    SizedBox(
                      height: height * 0.02,
                    ),
                    Transform(
                      transform: Matrix4.translationValues(
                          delayedAnimation.value * width, 0, 0),
                      child: BouncingButton(
                        onPress: () async {
                          if (_formkey.currentState.validate()) {
                            String studentId = '0';
                            if (widget.student != null) {
                              studentId = widget.student.id;
                            }
                            Student newStudent = new Student(
                              id: studentId,
                              maSinhVien: conMaSinhVien.text,
                              tenSinhVien: conTenSinhVien.text,
                              chuyenNganh: conChuyenNganh,
                              giangVienHuongDan: conGiangVien,
                              noiThucTap: conNoiThucTap,
                              lopHocPhan: conLopHocPhan,
                            );

                            var studentProvider = Provider.of<StudentProvider>(
                              context,
                              listen: false,
                            );

                            await studentProvider.createOrUpdate(newStudent);

                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => WrapperList(
                                  classroomId: widget.classroomId,
                                  departmentId: widget.departmentId,
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
