import 'package:dartz/dartz.dart';
import 'package:my_mydical/feature/Doctors/domain/antites/DoctorData.dart';
import 'package:my_mydical/feature/nurses/domain/repository/repository.dart';

abstract class RepositoryDoctor {
  Future<Either<Faluer, List<DoctorData>>> getallDoctor();
}
