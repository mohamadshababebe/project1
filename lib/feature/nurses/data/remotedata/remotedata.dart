import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:my_mydical/feature/nurses/data/models/nursesmodel.dart';
import 'package:my_mydical/feature/nurses/domain/repository/repository.dart';

abstract class RemoteDataNurses {
  Future<List<NursesModel>> getallNurses();
}

class RemoteDataImblNurses extends RemoteDataNurses {
  http.Client client;
  RemoteDataImblNurses({required this.client});
  @override
  // Future<Either<Faluer,List<NursesModel>>> getallNurses() async {
  Future<List<NursesModel>> getallNurses() async {
    final response = await client.get(
        Uri.parse('http://192.168.1.104:8000/api/nuers'),
        headers: {'Content-Type': 'application/json'});

    // try {
    //   res= _returnResponse(response);

    //   final List<NursesModel> getdata =
    //       res.map<NursesModel>((e) => NursesModel.fromJson(e)).toList();
    //       return Right(getdata);
    // } catch (e) {
    //   return Left(e.)
    // }

    if (response.statusCode == 200) {
      final List jsondecode = await jsonDecode(response.body) as List;
      final List<NursesModel> getdata =
          jsondecode.map<NursesModel>((e) => NursesModel.fromJson(e)).toList();
      return getdata;
    } else if (response.statusCode == 400) {
      // Left l = Left<Faluer, List<NursesModel>>(Faluer(message: response.error));
      // return jsonDecode(response.body)['massage'];
      return [];
    } else {
      throw Exception();
    }
  }
}

// _returnResponse(http.Response response){
  
//     if (response.statusCode == 200) {
//       final List jsondecode = await jsonDecode(response.body) as List;
//       final List<NursesModel> getdata =
//           jsondecode.map<NursesModel>((e) => NursesModel.fromJson(e)).toList();
//       return getdata;
//     } else if (response.statusCode == 400) {
//       // Left l = Left<Faluer, List<NursesModel>>(Faluer(message: response.error));
//       // return jsonDecode(response.body)['massage'];
//       return [];
//     } else {
//       throw Exception();
//     }
// }