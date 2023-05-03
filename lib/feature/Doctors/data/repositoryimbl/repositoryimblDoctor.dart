import 'dart:io';

import 'package:my_mydical/feature/Doctors/data/remotedata/remtedataDoctor.dart';
import 'package:my_mydical/feature/Doctors/domain/antites/DoctorData.dart';
import 'package:dartz/dartz.dart';
import 'package:my_mydical/feature/Doctors/domain/repository/repository.dart';
import 'package:my_mydical/feature/auth/data/datasorce/remotedata.dart';
import 'package:my_mydical/feature/nurses/domain/repository/repository.dart';

class RepositoryImblDoctor extends RepositoryDoctor {
  RemoteDataDoctor remoteDataDoctor;
  RepositoryImblDoctor({required this.remoteDataDoctor});
  @override
  Future<Either<Faluer, List<DoctorData>>> getallDoctor() async {
    try {
      final remtewithapi = await remoteDataDoctor.getalldataDoctor();
      return Right(remtewithapi);
    } on HttpException catch (e) {
      throw Exception(e.toString());
    }
  }
}
