import 'package:student_internships_management/models/Student.dart';

class Report {
  num id;
  Student student;
  String deTai;
  String noiDung;
  DateTime ngayBaoCao;

  set setDeTai(String value) {
    deTai = value;
  }

  set setNoiDung(String value) {
    noiDung = value;
  }

  set setNgayBaoCao(DateTime value) {
    ngayBaoCao = value;
  }

  set setStudent(Student value) {
    student = value;
  }

  Report({this.id, this.student, this.deTai, this.noiDung, this.ngayBaoCao});

  Report.cloneByObject(Report s) {
    this.noiDung = s.noiDung;
    this.ngayBaoCao = s.ngayBaoCao;
    this.deTai = s.deTai;
    this.student = s.student;
  }

  factory Report.fromJson(Map<String, dynamic> obj) {
    return Report(
      id: obj['id'],
      student: Student.fromJson(obj['student']),
      deTai: obj['deTai'],
      noiDung: obj['noiDung'],
      ngayBaoCao: DateTime.parse(obj['ngayBaoCao']),
    );
  }
}
