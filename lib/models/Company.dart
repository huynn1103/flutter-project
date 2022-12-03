class Company {
  num id;
  String tenDoanhNghiep;

  Company({this.id, this.tenDoanhNghiep});

  factory Company.fromJson(Map<String, dynamic> obj) {
    return Company(
      id: obj['id'],
      tenDoanhNghiep: obj['tenDoanhNghiep'],
    );
  }
}
