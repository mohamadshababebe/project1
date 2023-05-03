import 'package:equatable/equatable.dart';
import 'package:flutter/src/material/dropdown.dart';

class MyAppointmentModel extends Equatable {
  String? name;
  int? id;
  int? user_id;
  int? doctor_id;
  String? phone;
  String? birthday;
  String? address;
  String? time;
  String? date;
  String? status;
  String? diagnosis;
  MyAppointmentModel(
      {this.status,
      this.id,
      this.user_id,
      this.address,
      this.birthday,
      this.date,
      this.diagnosis,
      this.name,
      this.phone,
      this.time,
      this.doctor_id});
  factory MyAppointmentModel.fromJson(Map<String, dynamic> json) {
    return MyAppointmentModel(
        id: json['id'],
        status: json['status'],
        user_id: json['user_id'],
        doctor_id: json['doctor_id'],
        address: json['address'],
        birthday: json['birthday'],
        date: json['date'],
        diagnosis: json['diagnosis'],
        name: json['name'],
        phone: json['phone'],
        time: json['time']);
  }
  Map<String, dynamic> tojson() {
    Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['status'] = this.status;
    data['user_id'] = this.user_id;
    data['doctor_id'] = this.doctor_id;
    data['address'] = this.address;
    data['birthday'] = this.birthday;
    data['date'] = this.date;
    data['diagnosis'] = this.diagnosis;
    data['name'] = this.name;
    data['phone'] = this.phone;
    data['time'] = this.time;
    return data;
  }

  @override
  List<Object?> get props =>
      [address, birthday, date, diagnosis, name, phone, time, doctor_id];
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
  // "id": 42,
  //       "user_id": 1,
  //       "doctor_id": 2,
  //       "name": "kkoko",
  //       "phone": 67990,
  //       "birthday": "2000-02-02",
  //       "address": "sosana",
  //       "time": "13:00:00",
  //       "date": "2023-04-26",
  //       "status": "Pending",
  //       "diagnosis": null,