import 'dart:convert';

import 'package:my_mydical/feature/Doctors/domain/antites/DoctorData.dart';
import 'package:http/http.dart' as http;

abstract class RemoteDataDoctor {
  Future<List<DoctorData>> getalldataDoctor();
}

class RemoteDataImblDoctor extends RemoteDataDoctor {
  http.Client client;
  RemoteDataImblDoctor({required this.client});
  @override
  Future<List<DoctorData>> getalldataDoctor() async {
    final response = await client.get(
        Uri.parse('http://192.168.1.104:8000/api/get/ALLDoctoer'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': '*/*',
        });
    if (response.statusCode == 200) {
      final List jsondecode = await jsonDecode(response.body);
      final List<DoctorData> getdata = await jsondecode
          .map<DoctorData>((e) => DoctorData.fromJson(e))
          .toList();
      return getdata;
    } else {
      throw Exception();
    }
  }
}
