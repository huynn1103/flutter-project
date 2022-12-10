import 'package:student_internships_management/models/Classroom.dart';
import 'package:student_internships_management/models/Company.dart';
import 'package:student_internships_management/models/Major.dart';
import 'package:student_internships_management/models/Teacher.dart';

class Student {
  String id;
  String maSinhVien;
  String tenSinhVien;
  Major chuyenNganh;
  Teacher giangVienHuongDan;
  Company noiThucTap;
  Classroom lopHocPhan;

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
      id: obj['id'].toString(),
      maSinhVien: obj['maSinhVien'],
      tenSinhVien: obj['tenSinhVien'],
      chuyenNganh: Major.fromJson(obj['major']),
      giangVienHuongDan: Teacher.fromJson(obj['teacher']),
      noiThucTap: Company.fromJson(obj['company']),
      lopHocPhan: Classroom.fromJson(obj['classroom']),
    );
  }
}
