// ignore_for_file: non_constant_identifier_names

import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class AddDoctorData extends Equatable {
  String? name;
  String? time;
  String? date;
  String? phone;
  String? address;
  String? birthday;
  String? doctor_id;
  AddDoctorData(
      {required this.address,
      required this.doctor_id,
      required this.birthday,
      required this.date,
      required this.name,
      required this.phone,
      required this.time});
  factory AddDoctorData.fromJson(Map<String, dynamic> json) {
    return AddDoctorData(
        birthday: json['birthday'],
        doctor_id: json['doctor_id'],
        address: json['address'],
        date: json['date'],
        name: json['name'],
        phone: json['phone'],
        time: json['time']);
  }
  Map<String, dynamic> tojson() {
    Map<String, dynamic> data = new Map<String, dynamic>();
    data['doctor_id'] = this.doctor_id;
    data['birthday'] = this.birthday;
    data['date'] = this.date;
    data['name'] = this.name;
    data['phone'] = this.phone;
    data['time'] = this.time;
    data['address'] = this.address;
    return data;
  }

  @override
  List<Object?> get props =>
      [doctor_id, birthday, date, name, phone, time, address];
}

class DoctorDatas extends Equatable {
  String? name;
  int? id;
  DoctorDatas({required this.name, this.id});
  factory DoctorDatas.fromJson(Map<String, dynamic> json) {
    return DoctorDatas(name: json['name'], id: json['id']);
  }
  Map<String, dynamic> tojson() {
    Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['id'] = this.id;
    return data;
  }

  @override
  List<Object?> get props => [name, id];
}

class TimesModel {
  final List<String> times;
  TimesModel({required this.times});

  // TimeOfDay bla(String time) {
  //   List<String> hours = time.split(':');
  //   return TimeOfDay(
  //       hour: int.parse(hours.first), minute: int.parse(hours.last));
  // }

  factory TimesModel.fromJson(Map<String, dynamic> json) {
    return TimesModel(
      times: List<String>.from(json['times']),
    );
  }
}



// {
//     "times": [
//         "09:00",
//         "09:30",
//         "10:00",
//         "10:30",
//         "11:00",
//         "11:30",
//         "12:00",
//         "12:30",
//         "13:00",
//         "13:30",
//         "14:00",
//         "14:30",
//         "15:00",
//         "15:30",
//         "16:00",
//         "16:30",
//         "17:00"
//     ]
// }
 // TimeOfDay bla(String time) {
  //   List<String> hours = time.split(':');
  //   return TimeOfDay(
  //       hour: int.parse(hours.first), minute: int.parse(hours.last));
  // }
