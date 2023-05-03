import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:my_mydical/feature/auth/data/models/LoginModel.dart';
import 'package:http/http.dart' as http;

abstract class RemoteData {
  Future<String> Login(LoginModel loginModel);
}

class RemoteDataImbl extends RemoteData {
  http.Client client;
  RemoteDataImbl({required this.client});
  @override
  Future<String> Login(LoginModel loginModel) async {
    final response = await client.post(
      Uri.parse('http://192.168.1.104:8000/api/login'),
      headers: {
        'Content-Type': 'application/json',
        'Accept': '*/*',
      },
      body: jsonEncode(
          {"email": loginModel.email, "password": loginModel.password}),
    );

    if (response.statusCode == 201) {
      return jsonDecode(response.body)['token'];
    } else {
      var data = jsonDecode(response.body);
      throw Exception(data['mesegag']);
    }
  }
}
