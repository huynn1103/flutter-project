import 'package:student_internships_management/models/Department.dart';

class Company {
  String id;
  String tenDoanhNghiep;
  Department khoa;

  Company({this.id, this.tenDoanhNghiep, this.khoa});

  factory Company.fromJson(Map<String, dynamic> obj) {
    return Company(
      id: obj['id'].toString(),
      tenDoanhNghiep: obj['tenDoanhNghiep'],
      khoa: Department.fromJson(obj['department']),
    );
  }
}
