class Department {
  String id;
  String tenKhoa;

  Department({this.id, this.tenKhoa});

  factory Department.fromJson(Map<String, dynamic> obj) {
    return Department(
      id: obj['id'].toString(),
      tenKhoa: obj['tenKhoa'],
    );
  }
}
