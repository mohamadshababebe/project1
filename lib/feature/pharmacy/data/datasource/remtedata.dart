import 'dart:convert';

import 'package:my_mydical/feature/pharmacy/domain/antites/antites.dart';
import 'package:http/http.dart' as http;

abstract class RemoteDataPharmacy {
  Future<List<DataPharmcay>> getallpharmacy();
}

class RemoteDataPharmacyImbl extends RemoteDataPharmacy {
  http.Client client;
  RemoteDataPharmacyImbl({required this.client});
  @override
  Future<List<DataPharmcay>> getallpharmacy() async {
    final response = await client.get(
        Uri.parse('http://192.168.1.104:8000/api/pharmise'),
        headers: {'Content-Type': 'application/json'});
    if (response.statusCode == 200) {
      final List Jsondecode = await jsonDecode(response.body);
      final List<DataPharmcay> getalldata =
          Jsondecode.map<DataPharmcay>((e) => DataPharmcay.fromJson(e))
              .toList();
      return getalldata;
    } else {
      throw Exception();
    }
  }
}
