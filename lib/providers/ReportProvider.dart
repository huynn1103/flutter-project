import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:student_internships_management/models/Report.dart';

class ReportProvider extends ChangeNotifier {
  Future<List<Report>> findAll(String id) async {
    String apiURL = 'http://localhost:5000/report';
    if (id != '0') apiURL += '?studentId=${id}';
    var client = http.Client();
    var response = await client.get(Uri.parse(apiURL));
    var jsonObject = jsonDecode(response.body);
    var newsListObject = jsonObject as List;
    List<Report> list = newsListObject.map((e) {
      return Report.fromJson(e);
    }).toList();
    notifyListeners();
    debugPrint('Find all report.');
    return list;
  }

  Future<Report> findOne(String id) async {
    String apiURL = 'http://localhost:5000/report/${id}';
    var client = http.Client();
    var response = await client.get(Uri.parse(apiURL));
    var jsonObject = jsonDecode(response.body);
    notifyListeners();
    debugPrint('Find one report.');
    return Report.fromJson(jsonObject);
  }

  Future<bool> create(Report model) async {
    String apiURL = 'http://localhost:5000/report/';
    var client = http.Client();
    Map<String, String> headers = {"Content-type": "application/json"};
    String body = '{"deTai": "${model.deTai}"}';
    http.Response response = await client.post(
      Uri.parse(apiURL),
      headers: headers,
      body: body,
    );
    debugPrint('Create report.');
    return response.statusCode == 200;
  }

  Future<bool> update(Report model) async {
    String apiURL = 'http://localhost:5000/report/${model.id}';
    var client = http.Client();
    Map<String, String> headers = {"Content-type": "application/json"};
    String body = '{"deTai": "${model.deTai}"}';
    http.Response response = await client.patch(
      Uri.parse(apiURL),
      headers: headers,
      body: body,
    );
    debugPrint('Update report.');
    return response.statusCode == 200;
  }

  Future<bool> delete(String id) async {
    String apiURL = 'http://localhost:5000/report/${id}';
    var client = http.Client();
    Map<String, String> headers = {"Content-type": "application/json"};
    http.Response response = await client.delete(
      Uri.parse(apiURL),
      headers: headers,
    );
    debugPrint('Delete report.');
    return response.statusCode == 200;
  }
}
