import 'package:equatable/equatable.dart';

class LoginData extends Equatable {
  int? id;
  String? email;
  String? errorsmassage;
  String password;
  LoginData({this.errorsmassage, this.id, this.email, required this.password});

  @override
  List<Object?> get props => throw UnimplementedError();
}
