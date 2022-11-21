import 'package:student_internships_management/models/Department.dart';
import 'package:student_internships_management/models/Teacher.dart';

class Classroom {
  String tenLop;
  Department khoa;
  Teacher giangVien;
  int soLuong;

  Classroom(this.tenLop, this.soLuong, this.khoa, this.giangVien);
}
