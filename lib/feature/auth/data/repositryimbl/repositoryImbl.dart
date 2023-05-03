import 'package:my_mydical/feature/auth/data/datasorce/remotedata.dart';
import 'package:my_mydical/feature/auth/data/models/LoginModel.dart';
import 'package:my_mydical/feature/auth/data/models/errors.dart';
import 'package:my_mydical/feature/auth/domain/antites/antites.dart';
import 'package:my_mydical/feature/auth/domain/repository/repositry.dart';

class RepositryImbl extends Repositry {
  RemoteData remoteData;

  RepositryImbl({required this.remoteData});
  @override
  Future<String> Login(LoginData loginData) async {
    LoginModel loginModel =
        LoginModel(email: loginData.email, password: loginData.password);
    try {
      final remitewithapi = await remoteData.Login(loginModel);
      return remitewithapi;
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
