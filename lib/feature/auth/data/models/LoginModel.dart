import 'package:equatable/equatable.dart';
import 'package:my_mydical/feature/auth/domain/antites/antites.dart';

class LoginModel extends LoginData {
  LoginModel({super.id, super.email, required super.password, });
  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return LoginModel(
        id: json['id'], email: json['email'], password: json['password'],);
  }
  Map<String, dynamic> tojson() {
    return {
  
      'id': id,
      'email': email,
      'password': password,
    };
  }
}


