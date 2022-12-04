import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:student_internships_management/models/Department.dart';

class DepartmentProvider extends ChangeNotifier {
  Future<List<Department>> findAll() async {
    String apiURL = 'http://localhost:5000/department/';
    var client = http.Client();
    var response = await client.get(Uri.parse(apiURL));
    var jsonObject = jsonDecode(response.body);
    var newsListObject = jsonObject as List;
    List<Department> list = newsListObject.map((e) {
      return Department.fromJson(e);
    }).toList();
    notifyListeners();
    debugPrint('Find all department.');
    return list;
  }

  Future<Department> findOne(String id) async {
    String apiURL = 'http://localhost:5000/department/${id}';
    var client = http.Client();
    var response = await client.get(Uri.parse(apiURL));
    var jsonObject = jsonDecode(response.body);
    notifyListeners();
    debugPrint('Find one department.');
    return Department.fromJson(jsonObject);
  }

  Future<bool> create(Department model) async {
    String apiURL = 'http://localhost:5000/department/';
    var client = http.Client();
    Map<String, String> headers = {"Content-type": "application/json"};
    String body = '{"tenKhoa": "${model.tenKhoa}"}';
    http.Response response = await client.post(
      Uri.parse(apiURL),
      headers: headers,
      body: body,
    );
    debugPrint('Create department.');
    return response.statusCode == 200;
  }

  Future<bool> update(Department model) async {
    String apiURL = 'http://localhost:5000/department/${model.id}';
    var client = http.Client();
    Map<String, String> headers = {"Content-type": "application/json"};
    String body = '{"tenKhoa": "${model.tenKhoa}"}';
    http.Response response = await client.patch(
      Uri.parse(apiURL),
      headers: headers,
      body: body,
    );
    debugPrint('Update department.');
    return response.statusCode == 200;
  }

  Future<bool> delete(String id) async {
    String apiURL = 'http://localhost:5000/department/${id}';
    var client = http.Client();
    Map<String, String> headers = {"Content-type": "application/json"};
    http.Response response = await client.delete(
      Uri.parse(apiURL),
      headers: headers,
    );
    debugPrint('Delete department.');
    return response.statusCode == 200;
  }
}
