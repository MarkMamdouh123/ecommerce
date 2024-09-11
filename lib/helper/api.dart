import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Api {
  Future<dynamic> get({required String url, @required String? token}) async {
    Map<String, String> header = {};
    http.Response response = await http.get(Uri.parse(url), headers: header);

    if (token != null) {
      header.addAll({'Authorization': 'Bearer $token'});
    }
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception("Something get Wrong ${response.statusCode}");
    }
  }

  Future<dynamic> post(
      {required String url,
      @required dynamic body,
      @required header,
      @required String? token}) async {
    Map<String, String> header = {};
    if (token != null) {
      header.addAll({'Authorization': 'Bearer $token'});
    }
    http.Response response = await http.post(Uri.parse(url));

    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);
      return data;
    } else {
      throw Exception("Something post Wrong ${response.statusCode}");
    }
  }

  Future<dynamic> put(
      {required String url,
      @required dynamic body,
      @required header,
      @required String? token}) async {
    Map<String, String> header = {};
    header.addAll({' Content-Type': 'application/x-www-form-urlencoded'});
    if (token != null) {
      header.addAll({'Authorization': 'Bearer $token'});
    }
    http.Response response = await http.put(Uri.parse(url));
    print(' url is ${url}, body is $body');
    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);
      return data;
    } else {
      throw Exception("Something put Wrong ${response.statusCode}");
    }
  }
}
