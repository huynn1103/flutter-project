import 'package:student_internships_management/models/Classroom.dart';
import 'package:student_internships_management/models/Company.dart';
import 'package:student_internships_management/models/Major.dart';
import 'package:student_internships_management/models/Teacher.dart';

class Student {
  num id;
  String maSinhVien;
  String tenSinhVien;
  String chuyenNganh;
  String giangVienHuongDan;
  String noiThucTap;
  Classroom lopHocPhan;

  set setMaSinhVien(String value) {
    maSinhVien = value;
  }

  set setTenSinhVien(String value) {
    tenSinhVien = value;
  }

  set setChuyenNganh(String value) {
    chuyenNganh = value;
  }

  set setGiangVien(String value) {
    giangVienHuongDan = value;
  }

  set setNoiThucTap(String value) {
    noiThucTap = value;
  }

  set setLop(Classroom value) {
    lopHocPhan = value;
  }

  Student({
    this.id,
    this.maSinhVien,
    this.tenSinhVien,
    this.chuyenNganh,
    this.giangVienHuongDan,
    this.noiThucTap,
    this.lopHocPhan,
  });

  Student.cloneByObject(Student s) {
    this.maSinhVien = s.maSinhVien;
    this.tenSinhVien = s.tenSinhVien;
    this.chuyenNganh = s.chuyenNganh;
    this.giangVienHuongDan = s.giangVienHuongDan;
    this.noiThucTap = s.noiThucTap;
    this.lopHocPhan = s.lopHocPhan;
  }

  factory Student.fromJson(Map<String, dynamic> obj) {
    return Student(
      id: obj['id'],
      maSinhVien: obj['maSinhVien'],
      tenSinhVien: obj['tenSinhVien'],
      chuyenNganh: Major.fromJson(obj['major']).tenChuyenNganh,
      giangVienHuongDan: Teacher.fromJson(obj['teacher']).tenGiangVien,
      noiThucTap: Company.fromJson(obj['company']).tenDoanhNghiep,
      lopHocPhan: Classroom.fromJson(obj['classroom']),
    );
  }
}
