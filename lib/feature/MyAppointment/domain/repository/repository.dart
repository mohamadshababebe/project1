import 'package:dartz/dartz.dart';
import 'package:my_mydical/feature/nurses/domain/repository/repository.dart';

import '../antites/antites.dart';

abstract class RepositoryMyAppointment {
  Future<List<MyAppointmentModel>> getmyappointment();
  Future<List<DoctorDatas>> Doctors();
  Future<Either<Faluer, Unit>> UpdateAppointment(
      MyAppointmentModel myAppointmentModel);
  Future<TimesModel> fetchTimes();
  Future<Either<Faluer, Unit>> deleteappointmnet(int id);
}
