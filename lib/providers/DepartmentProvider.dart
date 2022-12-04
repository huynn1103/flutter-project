import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:student_internships_management/models/Department.dart';

class DepartmentProvider extends ChangeNotifier {
  Future<List<Department>> findAll() async {
    String apiURL = 'http://localhost:5000/department/';
    var client = http.Client();
    var jsonString = await client.get(Uri.parse(apiURL));
    var jsonObject = jsonDecode(jsonString.body);
    var newsListObject = jsonObject as List;
    List<Department> list = newsListObject.map((e) {
      return Department.fromJson(e);
    }).toList();
    notifyListeners();
    return list;
  }

  Future<bool> create(Department model) async {
    String apiURL = 'http://localhost:5000/products/';
    var client = http.Client();
    Map<String, String> headers = {"Content-type": "application/json"};
    String body = '{"tenKhoa": "${model.tenKhoa}"}';
    http.Response response = await client.post(
      Uri.parse(apiURL),
      headers: headers,
      body: body,
    );

    return response.statusCode == 200;
  }
}
