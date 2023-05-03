import 'package:equatable/equatable.dart';

class DataProfile extends Equatable {
  String? name;
  String? email;
  int? phone;
  String? address;
  String? birthday;
  String? gender;
  DataProfile(
      {required this.address,
      required this.gender,
      required this.birthday,
      required this.email,
      required this.name,
      required this.phone});
  factory DataProfile.fromJson(Map<String, dynamic> json) {
    return DataProfile(
        gender: json['gender'],
        address: json['address'],
        birthday: json['birthday'],
        email: json['email'],
        name: json['name'],
        phone: json['phone']);
  }
  Map<String, dynamic> tojson() {
    Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['email'] = this.email;
    data['birthday'] = this.birthday;
    data['phone'] = this.phone;
    data['address'] = this.address;
    data['gender'] = this.gender;
    return data;
  }

  @override
  List<Object?> get props => [name, email, phone, birthday, address];
}
