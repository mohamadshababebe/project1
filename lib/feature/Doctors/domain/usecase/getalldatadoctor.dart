import 'package:dartz/dartz.dart';
import 'package:my_mydical/feature/Doctors/domain/antites/DoctorData.dart';
import 'package:my_mydical/feature/Doctors/domain/repository/repository.dart';
import 'package:my_mydical/feature/nurses/domain/repository/repository.dart';

class GetAllDoctorUseCase {
  RepositoryDoctor repositoryDoctor;
  GetAllDoctorUseCase({required this.repositoryDoctor});
  Future<Either<Faluer, List<DoctorData>>> call() {
    return repositoryDoctor.getallDoctor();
  }
}
