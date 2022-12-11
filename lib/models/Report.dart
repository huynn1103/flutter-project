import 'package:student_internships_management/models/Student.dart';

class Report {
  String id;
  Student student;
  String deTai;
  String noiDung;
  DateTime ngayBaoCao;

  Report({this.id, this.student, this.deTai, this.noiDung, this.ngayBaoCao});

  factory Report.fromJson(Map<String, dynamic> obj) {
    return Report(
      id: obj['id'].toString(),
      student: Student.fromJson(obj['student']),
      deTai: obj['deTai'],
      noiDung: obj['noiDung'],
      ngayBaoCao: DateTime.parse(obj['ngayBaoCao']),
    );
  }
}
