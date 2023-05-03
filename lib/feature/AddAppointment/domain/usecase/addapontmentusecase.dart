import 'package:my_mydical/feature/AddAppointment/domain/antites/antittes.dart';

import '../repositry/addapointmentrepository.dart';

class UseCaseAddAppointment {
  RepositryAdd repositryAdd;
  UseCaseAddAppointment({required this.repositryAdd});
  Future<AddDoctorData> call(AddDoctorData addDoctorData) async {
    return await repositryAdd.AddAppointment(addDoctorData);
  }
}

class UsecaseDoctorData {
  RepositryAdd repositryAdd;
  UsecaseDoctorData({required this.repositryAdd});
  Future<List<DoctorDatas>> call() async {
    return await repositryAdd.Doctors();
  }
}

class UseCaseDoctorTimes {
  RepositryAdd repositryAdd;
  UseCaseDoctorTimes({required this.repositryAdd});
  Future<TimesModel> call() async {
    return await repositryAdd.fetchTimes();
  }
}
