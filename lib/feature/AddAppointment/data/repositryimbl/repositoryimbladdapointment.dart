// ignore_for_file: non_constant_identifier_names

import 'dart:io';

import 'package:my_mydical/feature/AddAppointment/domain/antites/antittes.dart';

import '../../domain/repositry/addapointmentrepository.dart';
import '../remotedata/remotedataaddapointment.dart';

class RepositryImblAdd extends RepositryAdd {
  RemoteDataAdd remoteDataAdd;
  RepositryImblAdd({required this.remoteDataAdd});
  @override
  Future<AddDoctorData> AddAppointment(AddDoctorData addDoctorData) async {
    try {
      final remotewithapi = await remoteDataAdd.addapointment(addDoctorData);
      return remotewithapi;
    } on HttpException catch (e) {
      throw Exception(e.toString());
    } on Exception catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<List<DoctorDatas>> Doctors() async {
    try {
      final remotewithapi = await remoteDataAdd.docotrs();
      return remotewithapi;
    } catch (e) {
      throw Exception();
    }
  }

  @override
  Future<TimesModel> fetchTimes() async {
    try {
      final remotwithapis = await remoteDataAdd.fetchTimes();
      return remotwithapis;
    } catch (e) {
      throw Exception();
    }
  }
}
