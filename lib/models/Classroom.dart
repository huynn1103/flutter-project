import 'package:student_internships_management/models/Department.dart';
import 'package:student_internships_management/models/Teacher.dart';

class Classroom {
  String id;
  String tenLop;
  Department khoa;
  Teacher giangVien;
  int soLuong;

  Classroom({this.id, this.tenLop, this.soLuong, this.khoa, this.giangVien});

  factory Classroom.fromJson(Map<String, dynamic> obj) {
    return Classroom(
      id: obj['id'].toString(),
      tenLop: obj['tenLop'],
      khoa: Department.fromJson(obj['department']),
      giangVien: Teacher.fromJson(obj['teacher']),
      soLuong: obj['soLuong'],
    );
  }
}
