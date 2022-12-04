import 'package:student_internships_management/models/Department.dart';

class Teacher {
  String id;
  String tenGiangVien;
  Department khoa;

  Teacher({this.id, this.tenGiangVien, this.khoa});

  factory Teacher.fromJson(Map<String, dynamic> obj) {
    return Teacher(
      id: obj['id'].toString(),
      tenGiangVien: obj['tenGiangVien'],
      khoa: Department.fromJson(obj['department']),
    );
  }

  factory Teacher.fromJsonExceptDepartment(Map<String, dynamic> obj) {
    return Teacher(
      id: obj['id'].toString(),
      tenGiangVien: obj['tenGiangVien'],
    );
  }
}
