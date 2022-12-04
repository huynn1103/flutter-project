import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:student_internships_management/models/Classroom.dart';

class ClassroomProvider extends ChangeNotifier {
  Future<List<Classroom>> findAll(String id) async {
    String apiURL = 'http://localhost:5000/classroom';
    if (id != '0') apiURL += '?departmentId=${id}';
    var client = http.Client();
    var response = await client.get(Uri.parse(apiURL));
    var jsonObject = jsonDecode(response.body);
    var newsListObject = jsonObject as List;
    List<Classroom> list = newsListObject.map((e) {
      return Classroom.fromJson(e);
    }).toList();
    notifyListeners();
    debugPrint('Find all classroom.');
    return list;
  }

  Future<Classroom> findOne(String id) async {
    String apiURL = 'http://localhost:5000/classroom/${id}';
    var client = http.Client();
    var response = await client.get(Uri.parse(apiURL));
    var jsonObject = jsonDecode(response.body);
    notifyListeners();
    debugPrint('Find one classroom.');
    return Classroom.fromJson(jsonObject);
  }

  Future<bool> create(Classroom model) async {
    String apiURL = 'http://localhost:5000/classroom/';
    var client = http.Client();
    Map<String, String> headers = {"Content-type": "application/json"};
    String body =
        '{"tenLop": "${model.tenLop}", "soLuong": "${model.soLuong}"}';
    http.Response response = await client.post(
      Uri.parse(apiURL),
      headers: headers,
      body: body,
    );
    debugPrint('Create classroom.');
    return response.statusCode == 200;
  }

  Future<bool> update(Classroom model) async {
    String apiURL = 'http://localhost:5000/classroom/${model.id}';
    var client = http.Client();
    Map<String, String> headers = {"Content-type": "application/json"};
    String body =
        '{"tenLop": "${model.tenLop}", "soLuong": "${model.soLuong}"}';
    http.Response response = await client.patch(
      Uri.parse(apiURL),
      headers: headers,
      body: body,
    );
    debugPrint('Update classroom.');
    return response.statusCode == 200;
  }

  Future<bool> delete(String id) async {
    String apiURL = 'http://localhost:5000/classroom/${id}';
    var client = http.Client();
    Map<String, String> headers = {"Content-type": "application/json"};
    http.Response response = await client.delete(
      Uri.parse(apiURL),
      headers: headers,
    );
    debugPrint('Delete classroom.');
    return response.statusCode == 200;
  }
}
