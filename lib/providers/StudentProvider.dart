import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:student_internships_management/models/Student.dart';

class StudentProvider extends ChangeNotifier {
  Future<List<Student>> findAll(String id) async {
    String apiURL = 'http://localhost:5000/student';
    if (id != '0') apiURL += '?classroomId=${id}';
    var client = http.Client();
    var response = await client.get(Uri.parse(apiURL));
    var jsonObject = jsonDecode(response.body);
    var newsListObject = jsonObject as List;
    List<Student> list = newsListObject.map((e) {
      return Student.fromJson(e);
    }).toList();
    notifyListeners();
    debugPrint('Find all student.');
    return list;
  }

  Future<Student> findOne(String id) async {
    String apiURL = 'http://localhost:5000/student/${id}';
    var client = http.Client();
    var response = await client.get(Uri.parse(apiURL));
    var jsonObject = jsonDecode(response.body);
    notifyListeners();
    debugPrint('Find one student.');
    return Student.fromJson(jsonObject);
  }

  Future<bool> create(Student model) async {
    String apiURL = 'http://localhost:5000/student/';
    var client = http.Client();
    Map<String, String> headers = {"Content-type": "application/json"};
    String body = '{"tenSinhVien": "${model.tenSinhVien}"}';
    http.Response response = await client.post(
      Uri.parse(apiURL),
      headers: headers,
      body: body,
    );
    debugPrint('Create student.');
    return response.statusCode == 200;
  }

  Future<bool> update(Student model) async {
    String apiURL = 'http://localhost:5000/student/${model.id}';
    var client = http.Client();
    Map<String, String> headers = {"Content-type": "application/json"};
    String body = '{"tenSinhVien": "${model.tenSinhVien}"}';
    http.Response response = await client.patch(
      Uri.parse(apiURL),
      headers: headers,
      body: body,
    );
    debugPrint('Update student.');
    return response.statusCode == 200;
  }

  Future<bool> delete(String id) async {
    String apiURL = 'http://localhost:5000/student/${id}';
    var client = http.Client();
    Map<String, String> headers = {"Content-type": "application/json"};
    http.Response response = await client.delete(
      Uri.parse(apiURL),
      headers: headers,
    );
    debugPrint('Delete student.');
    return response.statusCode == 200;
  }
}
