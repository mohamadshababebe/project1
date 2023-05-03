import 'package:equatable/equatable.dart';

class DoctorData extends Equatable {
  int id;
  int clinic_id;
  String name;
  Detail detail;
  Clinic clinic;
  DoctorData(
      {required this.clinic,
      required this.clinic_id,
      required this.detail,
      required this.id,
      required this.name});
  factory DoctorData.fromJson(Map<String, dynamic> json) {
    return DoctorData(
        clinic: Clinic.fromJson(json['clinic']),
        clinic_id: json['clinic_id'],
        detail: Detail.fromJson(json['detail']),
        id: json['id'],
        name: json['name']);
  }

  @override
  List<Object?> get props => [name, clinic, clinic_id, detail, id];
}

class Detail extends Equatable {
  int id;
  int doctor_id;
  String specialization;
  int phone;
  String email;
  Detail(
      {required this.doctor_id,
      required this.email,
      required this.id,
      required this.phone,
      required this.specialization});
  factory Detail.fromJson(Map<String, dynamic> json) {
    return Detail(
        doctor_id: json['doctor_id'],
        email: json['email'],
        id: json['id'],
        phone: json['phone'],
        specialization: json['specialization']);
  }
  @override
  List<Object?> get props => [doctor_id, email, id, phone, specialization];
}

class Clinic extends Equatable {
  int id;
  String name;
  Clinic({required this.id, required this.name});
  factory Clinic.fromJson(Map<String, dynamic> json) {
    return Clinic(id: json['id'], name: json['name']);
  }
  @override
  List<Object?> get props =>[id,name];
}
