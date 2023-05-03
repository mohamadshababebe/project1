import 'package:dartz/dartz.dart';
import 'package:my_mydical/feature/MyAppointment/domain/antites/antites.dart';
import 'package:my_mydical/feature/MyAppointment/domain/repository/repository.dart';
import 'package:my_mydical/feature/nurses/domain/repository/repository.dart';

class UsecaseMyAppointment {
  RepositoryMyAppointment repositoryMyAppointment;
  UsecaseMyAppointment({required this.repositoryMyAppointment});
  Future<List<MyAppointmentModel>> call() {
    return repositoryMyAppointment.getmyappointment();
  }
}

class UsecaseDoctorDatas {
  RepositoryMyAppointment repositoryMyAppointment;
  UsecaseDoctorDatas({required this.repositoryMyAppointment});
  Future<List<DoctorDatas>> call() async {
    return await repositoryMyAppointment.Doctors();
  }
}

class UseCaseUpdateAppointment {
  RepositoryMyAppointment repositoryMyAppointment;
  UseCaseUpdateAppointment({required this.repositoryMyAppointment});
  Future<Either<Faluer, Unit>> call(
      MyAppointmentModel myAppointmentModel) async {
    return await repositoryMyAppointment.UpdateAppointment(myAppointmentModel);
  }
}

class UseCaseDoctorTime {
  RepositoryMyAppointment repositryMyAppointmentAdd;
  UseCaseDoctorTime({required this.repositryMyAppointmentAdd});
  Future<TimesModel> call() {
    return repositryMyAppointmentAdd.fetchTimes();
  }
}

class UsecaseDeleteAppointment {
  RepositoryMyAppointment repositoryMyAppointment;
  UsecaseDeleteAppointment({required this.repositoryMyAppointment});
  Future<Either<Faluer, Unit>> call(int id) async {
    return await repositoryMyAppointment.deleteappointmnet(id);
  }
}
