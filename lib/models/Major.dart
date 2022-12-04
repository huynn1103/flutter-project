import 'package:student_internships_management/models/Department.dart';

class Major {
  String id;
  String tenChuyenNganh;
  Department khoa;

  Major({this.id, this.tenChuyenNganh, this.khoa});

  factory Major.fromJson(Map<String, dynamic> obj) {
    return Major(
      id: obj['id'].toString(),
      tenChuyenNganh: obj['tenChuyenNganh'],
      khoa: Department.fromJson(obj['department']),
    );
  }
}
