import 'package:student_internships_management/models/Classroom.dart';

class Student {
  String maSinhVien;
  String tenSinhVien;
  String chuyenNganh;
  String giangVienHuongDan;
  String noiThucTap;
  bool status;
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

  set setStatus(bool value) {
    status = value;
  }

  set setLop(Classroom value) {
    lopHocPhan = value;
  }

  Student(this.maSinhVien, this.tenSinhVien, this.chuyenNganh,
      this.giangVienHuongDan, this.noiThucTap, this.lopHocPhan,
      [this.status = true]);

  Student.cloneByObject(Student s) {
    this.maSinhVien = s.maSinhVien;
    this.tenSinhVien = s.tenSinhVien;
    this.chuyenNganh = s.chuyenNganh;
    this.giangVienHuongDan = s.giangVienHuongDan;
    this.noiThucTap = s.noiThucTap;
    this.lopHocPhan = s.lopHocPhan;
  }
}
