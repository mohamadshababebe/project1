import 'package:dartz/dartz.dart';
import 'package:my_mydical/feature/MyAppointment/data/remotedata/remotedata.dart';
import 'package:my_mydical/feature/MyAppointment/domain/antites/antites.dart';
import 'package:my_mydical/feature/MyAppointment/domain/repository/repository.dart';
import 'package:my_mydical/feature/nurses/domain/repository/repository.dart';

class RepositryImblMyAppointment extends RepositoryMyAppointment {
  RemoteDataMyAppointment remoteDataMyAppointment;
  RepositryImblMyAppointment({required this.remoteDataMyAppointment});
  @override
  Future<List<MyAppointmentModel>> getmyappointment() async {
    try {
      final remotewithapi = await remoteDataMyAppointment.getmyappointment();
      return remotewithapi;
    } catch (e) {
      throw Exception();
    }
  }

  @override
  Future<List<DoctorDatas>> Doctors() async {
    try {
      final remotewithapi = await remoteDataMyAppointment.docotrs();
      return remotewithapi;
    } catch (e) {
      throw Exception();
    }
  }

  @override
  Future<Either<Faluer, Unit>> UpdateAppointment(
      MyAppointmentModel myAppointmentModel) async {
    try {
      final remoteapi =
          await remoteDataMyAppointment.updateappointment(myAppointmentModel);
      return const Right(unit);
    } catch (e) {
      throw Exception();
    }
  }

  @override
  Future<TimesModel> fetchTimes() async {
    try {
      final remotwithapis = await remoteDataMyAppointment.fetchTimes();
      return remotwithapis;
    } catch (e) {
      throw Exception();
    }
  }

  @override
  Future<Either<Faluer, Unit>> deleteappointmnet(int id) async {
    try {
      final remotedata = await remoteDataMyAppointment.deleteappointmnet(id);
      return const Right(unit);
    } catch (e) {
      throw Exception();
    }
  }
}
