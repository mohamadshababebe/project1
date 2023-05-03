import 'package:dartz/dartz.dart';
import 'package:my_mydical/feature/nurses/domain/repository/repository.dart';
import 'package:my_mydical/feature/pharmacy/domain/antites/antites.dart';
import 'package:my_mydical/feature/pharmacy/domain/repository/repository.dart';

class getallPharmacyUsecase {
  RepositoryPharmicy repositoryPharmicy;
  getallPharmacyUsecase({required this.repositoryPharmicy});
  Future<Either<Faluer, List<DataPharmcay>>> call() {
    return repositoryPharmicy.getallPharmacy();
  }
}
