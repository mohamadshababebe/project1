import 'package:my_mydical/feature/auth/domain/antites/antites.dart';
import 'package:my_mydical/feature/auth/domain/repository/repositry.dart';

class LoginUseCase {
  Repositry repositry;
  LoginUseCase({required this.repositry});
  Future<String> call(LoginData loginData) {
    return repositry.Login(loginData);
  }
}
