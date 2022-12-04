class Company {
  String id;
  String tenDoanhNghiep;

  Company({this.id, this.tenDoanhNghiep});

  factory Company.fromJson(Map<String, dynamic> obj) {
    return Company(
      id: obj['id'].toString(),
      tenDoanhNghiep: obj['tenDoanhNghiep'],
    );
  }
}
