import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:student_internships_management/models/Company.dart';

class CompanyProvider extends ChangeNotifier {
  Future<List<Company>> findAll(String id) async {
    String apiURL = 'http://localhost:5000/company';
    if (id != '0') apiURL += '?departmentId=${id}';
    var client = http.Client();
    var response = await client.get(Uri.parse(apiURL));
    var jsonObject = jsonDecode(response.body);
    var newsListObject = jsonObject as List;
    List<Company> list = newsListObject.map((e) {
      return Company.fromJson(e);
    }).toList();
    notifyListeners();
    debugPrint('Find all company.');
    return list;
  }

  Future<Company> findOne(String id) async {
    String apiURL = 'http://localhost:5000/company/${id}';
    var client = http.Client();
    var response = await client.get(Uri.parse(apiURL));
    var jsonObject = jsonDecode(response.body);
    notifyListeners();
    debugPrint('Find one company.');
    return Company.fromJson(jsonObject);
  }

  Future<bool> create(Company model) async {
    String apiURL = 'http://localhost:5000/company/';
    var client = http.Client();
    Map<String, String> headers = {"Content-type": "application/json"};
    String body = '{"tenDoanhNghiep": "${model.tenDoanhNghiep}"}';
    http.Response response = await client.post(
      Uri.parse(apiURL),
      headers: headers,
      body: body,
    );
    debugPrint('Create company.');
    return response.statusCode == 200;
  }

  Future<bool> update(Company model) async {
    String apiURL = 'http://localhost:5000/company/${model.id}';
    var client = http.Client();
    Map<String, String> headers = {"Content-type": "application/json"};
    String body = '{"tenDoanhNghiep": "${model.tenDoanhNghiep}"}';
    http.Response response = await client.patch(
      Uri.parse(apiURL),
      headers: headers,
      body: body,
    );
    debugPrint('Update company.');
    return response.statusCode == 200;
  }

  Future<bool> delete(String id) async {
    String apiURL = 'http://localhost:5000/company/${id}';
    var client = http.Client();
    Map<String, String> headers = {"Content-type": "application/json"};
    http.Response response = await client.delete(
      Uri.parse(apiURL),
      headers: headers,
    );
    debugPrint('Delete company.');
    return response.statusCode == 200;
  }
}
