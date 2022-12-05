import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:student_internships_management/models/Major.dart';

class MajorProvider extends ChangeNotifier {
  Future<List<Major>> findAll(String id) async {
    String apiURL = 'http://localhost:5000/major';
    if (id != '0') apiURL += '?departmentId=${id}';
    var client = http.Client();
    var response = await client.get(Uri.parse(apiURL));
    var jsonObject = jsonDecode(response.body);
    var newsListObject = jsonObject as List;
    List<Major> list = newsListObject.map((e) {
      return Major.fromJson(e);
    }).toList();
    notifyListeners();
    debugPrint('Find all major.');
    return list;
  }

  Future<Major> findOne(String id) async {
    String apiURL = 'http://localhost:5000/major/${id}';
    var client = http.Client();
    var response = await client.get(Uri.parse(apiURL));
    var jsonObject = jsonDecode(response.body);
    notifyListeners();
    debugPrint('Find one major.');
    return Major.fromJson(jsonObject);
  }

  Future<bool> create(Major model) async {
    String apiURL = 'http://localhost:5000/major/';
    var client = http.Client();
    Map<String, String> headers = {"Content-type": "application/json"};
    String body = '{"tenChuyenNganh": "${model.tenChuyenNganh}"}';
    http.Response response = await client.post(
      Uri.parse(apiURL),
      headers: headers,
      body: body,
    );
    debugPrint('Create major.');
    return response.statusCode == 200;
  }

  Future<bool> update(Major model) async {
    String apiURL = 'http://localhost:5000/major/${model.id}';
    var client = http.Client();
    Map<String, String> headers = {"Content-type": "application/json"};
    String body = '{"tenChuyenNganh": "${model.tenChuyenNganh}"}';
    http.Response response = await client.patch(
      Uri.parse(apiURL),
      headers: headers,
      body: body,
    );
    debugPrint('Update major.');
    return response.statusCode == 200;
  }

  Future<bool> delete(String id) async {
    String apiURL = 'http://localhost:5000/major/${id}';
    var client = http.Client();
    Map<String, String> headers = {"Content-type": "application/json"};
    http.Response response = await client.delete(
      Uri.parse(apiURL),
      headers: headers,
    );
    debugPrint('Delete major.');
    return response.statusCode == 200;
  }
}
