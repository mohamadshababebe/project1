import 'package:dartz/dartz.dart';
import 'package:my_mydical/feature/nurses/domain/antites/antitesnurs.dart';
import 'package:my_mydical/feature/nurses/domain/repository/repository.dart';

class GetAllNursesUsesCase {
  RepositryNurse repositryNurse;
  GetAllNursesUsesCase({required this.repositryNurse});
  Future<Either<Faluer, List<NureseData>>> call() async{
    return await repositryNurse.getallNurses();
  }
}
