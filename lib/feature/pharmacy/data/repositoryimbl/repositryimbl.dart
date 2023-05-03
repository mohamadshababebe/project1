import 'dart:io';

import 'package:my_mydical/feature/pharmacy/data/datasource/remtedata.dart';
import 'package:my_mydical/feature/pharmacy/domain/antites/antites.dart';
import 'package:my_mydical/feature/nurses/domain/repository/repository.dart';
import 'package:dartz/dartz.dart';
import 'package:my_mydical/feature/pharmacy/domain/repository/repository.dart';

class RepositryImblPharmcy extends RepositoryPharmicy {
  RemoteDataPharmacy remoteDataPharmacy;
  RepositryImblPharmcy({required this.remoteDataPharmacy});
  @override
  Future<Either<Faluer, List<DataPharmcay>>> getallPharmacy() async {
    try {
      final remotewithapi = await remoteDataPharmacy.getallpharmacy();
      return Right(remotewithapi);
    } on HttpException catch (e) {
      throw Exception(e.toString());
    }
  }
}
