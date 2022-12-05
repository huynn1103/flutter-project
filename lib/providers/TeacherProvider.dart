import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:student_internships_management/models/Teacher.dart';

class TeacherProvider extends ChangeNotifier {
  Future<List<Teacher>> findAll(String id) async {
    String apiURL = 'http://localhost:5000/teacher';
    if (id != '0') apiURL += '?departmentId=${id}';
    var client = http.Client();
    var response = await client.get(Uri.parse(apiURL));
    var jsonObject = jsonDecode(response.body);
    var newsListObject = jsonObject as List;
    List<Teacher> list = newsListObject.map((e) {
      return Teacher.fromJson(e);
    }).toList();
    notifyListeners();
    debugPrint('Find all teacher.');
    return list;
  }

  Future<Teacher> findOne(String id) async {
    String apiURL = 'http://localhost:5000/teacher/${id}';
    var client = http.Client();
    var response = await client.get(Uri.parse(apiURL));
    var jsonObject = jsonDecode(response.body);
    notifyListeners();
    debugPrint('Find one teacher.');
    return Teacher.fromJson(jsonObject);
  }

  Future<bool> create(Teacher model) async {
    String apiURL = 'http://localhost:5000/teacher/';
    var client = http.Client();
    Map<String, String> headers = {"Content-type": "application/json"};
    String body = '{"tenGiangVien": "${model.tenGiangVien}"}';
    http.Response response = await client.post(
      Uri.parse(apiURL),
      headers: headers,
      body: body,
    );
    debugPrint('Create teacher.');
    return response.statusCode == 200;
  }

  Future<bool> update(Teacher model) async {
    String apiURL = 'http://localhost:5000/teacher/${model.id}';
    var client = http.Client();
    Map<String, String> headers = {"Content-type": "application/json"};
    String body = '{"tenGiangVien": "${model.tenGiangVien}"}';
    http.Response response = await client.patch(
      Uri.parse(apiURL),
      headers: headers,
      body: body,
    );
    debugPrint('Update teacher.');
    return response.statusCode == 200;
  }

  Future<bool> delete(String id) async {
    String apiURL = 'http://localhost:5000/teacher/${id}';
    var client = http.Client();
    Map<String, String> headers = {"Content-type": "application/json"};
    http.Response response = await client.delete(
      Uri.parse(apiURL),
      headers: headers,
    );
    debugPrint('Delete teacher.');
    return response.statusCode == 200;
  }
}
