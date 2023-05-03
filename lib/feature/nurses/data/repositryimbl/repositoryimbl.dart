import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:my_mydical/feature/nurses/data/remotedata/remotedata.dart';
import 'package:my_mydical/feature/nurses/domain/antites/antitesnurs.dart';
import 'package:dartz/dartz.dart';
import 'package:my_mydical/feature/nurses/domain/repository/repository.dart';

class RepositoryImblNurses extends RepositryNurse {
  RemoteDataNurses remoteDataNurses;
  RepositoryImblNurses({required this.remoteDataNurses});
  @override
  Future<Either<Faluer, List<NureseData>>> getallNurses() async {
    try {
      final remotepost = await remoteDataNurses.getallNurses();
      return Right(remotepost);
    } on HttpException {
      throw Exception();
    }
  }
}
