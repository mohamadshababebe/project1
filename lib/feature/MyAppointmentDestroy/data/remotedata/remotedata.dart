import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../../domain/antites/antites.dart';
import 'package:http/http.dart' as http;

abstract class RemoteDataMyAppointmentDestroy {
  Future<List<MyAppointmentDestroy>> Destroy();
}

class RemoteDataImblMyAppointmentDestroy
    extends RemoteDataMyAppointmentDestroy {
  http.Client client;
  RemoteDataImblMyAppointmentDestroy({required this.client});
  @override
  Future<List<MyAppointmentDestroy>> Destroy() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String token = await sharedPreferences.getString('ID_TOKENS') ?? '';
    final response = await client.get(
        Uri.parse('http://192.168.1.104:8000/api/My/Reservation'),
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
          'Accept': '*/*',
        });
    if (response.statusCode == 200) {
      final List jsondecode = await jsonDecode(response.body);
      final List<MyAppointmentDestroy> data = await jsondecode
          .map<MyAppointmentDestroy>((e) => MyAppointmentDestroy.fromJson(e))
          .toList();
      return data;
    } else {
      throw Exception();
    }
  }
}
