import 'package:dartz/dartz.dart';
import 'package:my_mydical/feature/nurses/domain/repository/repository.dart';
import 'package:my_mydical/feature/profile/domain/antites/antitesprofile.dart';

abstract class RepositoryProfile {
  Future<Either<Faluer, DataProfile>> Profile();
}
