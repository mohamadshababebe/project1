import 'package:dartz/dartz.dart';
import 'package:my_mydical/feature/nurses/domain/repository/repository.dart';
import 'package:my_mydical/feature/pharmacy/domain/antites/antites.dart';

abstract class RepositoryPharmicy {
  Future<Either<Faluer, List<DataPharmcay>>> getallPharmacy();
}
