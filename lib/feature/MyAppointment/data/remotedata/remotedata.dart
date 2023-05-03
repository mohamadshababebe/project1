import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../domain/antites/antites.dart';

abstract class RemoteDataMyAppointment {
  Future<List<MyAppointmentModel>> getmyappointment();
  Future<List<DoctorDatas>> docotrs();
  Future<TimesModel> fetchTimes();
  Future<Unit> updateappointment(MyAppointmentModel myAppointmentModel);
  Future<Unit> deleteappointmnet(int id);
}

class RemoteDataImblMyAppointment extends RemoteDataMyAppointment {
  http.Client client;
  RemoteDataImblMyAppointment({required this.client});
  @override
  Future<List<MyAppointmentModel>> getmyappointment() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String Token = sharedPreferences.getString('ID_TOKENS') ?? '';
    final response = await client.get(
        Uri.parse('http://192.168.1.104:8000/api/My/Reservation'),
        headers: {
          'Authorization': 'Bearer $Token',
          'Content-Type': 'application/json',
          'Accept': '*/*',
        });
    if (response.statusCode == 200) {
      final List jsodecode = await jsonDecode(response.body);
      final List<MyAppointmentModel> getdata = jsodecode
          .map<MyAppointmentModel>((e) => MyAppointmentModel.fromJson(e))
          .toList();
      return getdata;
    } else {
      throw Exception();
    }
  }

  @override
  Future<List<DoctorDatas>> docotrs() async {
    final response = await client
        .get(Uri.parse('http://192.168.1.104:8000/api/get_All'), headers: {
      'Content-Type': 'application/json',
      'Accept': '*/*',
    });
    if (response.statusCode == 200) {
      final List jsondecode = jsonDecode(response.body);
      final List<DoctorDatas> getdocotor =
          jsondecode.map<DoctorDatas>((e) => DoctorDatas.fromJson(e)).toList();
      return getdocotor;
    } else {
      throw Exception();
    }
  }

  @override
  Future<Unit> updateappointment(MyAppointmentModel myAppointmentModel) async {
    int? id = myAppointmentModel.id;
    final response = await client.put(
      Uri.parse('http://192.168.1.104:8000/api/Reservation/update/$id'),
      headers: {
        'Content-Type': 'application/json',
        'Accept': '*/*',
      },
      body: jsonEncode({
        'id': myAppointmentModel.id,
        'name': myAppointmentModel.name,
        'doctor_id': myAppointmentModel.doctor_id,
        'phone': myAppointmentModel.phone,
        'birthday': myAppointmentModel.birthday,
        'address': myAppointmentModel.address,
        'time': myAppointmentModel.time,
        'date': myAppointmentModel.date,
      }),
    );
    if (response.statusCode == 200) {
      return unit;
    } else if (response.statusCode == 400) {
      var data = jsonDecode(response.body);
      throw Exception(data);
    } else {
      throw Exception();
    }
  }

  @override
  Future<TimesModel> fetchTimes() async {
    final response = await client
        .get(Uri.parse('http://192.168.1.104:8000/api/time'), headers: {
      'Content-Type': 'application/json',
      'Accept': '*/*',
    });
    if (response.statusCode == 200) {
      return TimesModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception();
    }
  }

  @override
  Future<Unit> deleteappointmnet(int id) async {
    final response = await client.post(
        Uri.parse('http://192.168.1.104:8000/api/Reservation/delete/$id'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': '*/*',
        });
    if (response.statusCode == 200) {
      return Future.value(unit);
    } else {
      throw Exception();
    }
  }
}
