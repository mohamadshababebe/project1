import 'package:my_mydical/feature/auth/domain/antites/antites.dart';

abstract class Repositry {
  Future<String> Login(LoginData loginData);
}
