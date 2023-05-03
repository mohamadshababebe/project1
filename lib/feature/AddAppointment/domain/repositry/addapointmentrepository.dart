import 'package:my_mydical/feature/AddAppointment/domain/antites/antittes.dart';

abstract class RepositryAdd {
  Future<AddDoctorData> AddAppointment(AddDoctorData addDoctorData);
  Future<List<DoctorDatas>> Doctors();
  Future<TimesModel> fetchTimes();
}
