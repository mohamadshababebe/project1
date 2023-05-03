import 'package:dartz/dartz.dart';
import 'package:my_mydical/feature/nurses/domain/antites/antitesnurs.dart';

abstract class RepositryNurse {
  Future<Either<Faluer, List<NureseData>>> getallNurses();
}

class Faluer {
  // String message;
  // int statusCode;
  
}
