import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:my_mydical/feature/profile/domain/antites/antitesprofile.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class RemoteDataProfile {
  Future<DataProfile> remotedata();
}

class RemoteDataImblProfile extends RemoteDataProfile {
  http.Client client;
  RemoteDataImblProfile({required this.client});
  @override
  Future<DataProfile> remotedata() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? Token = await sharedPreferences.getString('ID_TOKENS') ?? '';
    final response = await client.get(
      Uri.parse('http://192.168.1.104:8000/api/profile'),
      headers: {
        'Authorization': "Bearer $Token",
        'Content-Type': 'application/json',
        'Accept': '*/*',
      },
    );
    if (response.statusCode == 200) {
      return DataProfile.fromJson(jsonDecode(response.body));
    } else {
      throw Exception();
    }
  }
}
