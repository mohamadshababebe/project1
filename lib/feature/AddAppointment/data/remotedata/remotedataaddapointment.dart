import 'dart:convert';
import 'package:my_mydical/feature/AddAppointment/domain/antites/antittes.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

abstract class RemoteDataAdd {
  Future<AddDoctorData> addapointment(AddDoctorData addDoctorData);
  Future<List<DoctorDatas>> docotrs();
  Future<TimesModel> fetchTimes();
}

class RemoteDataImblAdd extends RemoteDataAdd {
  http.Client client;
  RemoteDataImblAdd({required this.client});
  @override
  Future<AddDoctorData> addapointment(AddDoctorData addDoctorData) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String token = sharedPreferences.getString('ID_TOKENS') ?? '';
    final response = await client.post(
      Uri.parse('http://192.168.1.104:8000/api/store'),
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
        'Accept': '*/*',
      },
      body: jsonEncode({
        'birthday': addDoctorData.birthday,
        'doctor_id': addDoctorData.doctor_id,
        'date': addDoctorData.date,
        'name': addDoctorData.name,
        'phone': addDoctorData.phone,
        'time': addDoctorData.time,
        'address': addDoctorData.address
      }),
    );
    if (response.statusCode == 200) {
      return AddDoctorData.fromJson(jsonDecode(response.body));
    } else if (response.statusCode == 400) {
      var data = jsonDecode(response.body);
      throw Exception(data);
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
  Future<TimesModel> fetchTimes() async {
    final response = await client
        .get(Uri.parse('http://192.168.1.104:8000/api/time'), headers: {
      'Content-Type': 'application/json',
      'Accept': '*/*',
    });
    if (response.statusCode == 200) {
      return TimesModel.fromJson(jsonDecode(response.body));
    } else {
      var  data = jsonDecode(response.body);
      throw Exception(data);
    }
  }
}
