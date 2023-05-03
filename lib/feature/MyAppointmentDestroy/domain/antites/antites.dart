import 'package:equatable/equatable.dart';

class MyAppointmentDestroy extends Equatable {
  int? user_id;
  int? doctor_id;
  String? name;
  String? phone;
  String? birthday;
  String? address;
  String? time;
  String? diagnosis;
  MyAppointmentDestroy(
      {this.address,
      this.birthday,
      this.diagnosis,
      this.doctor_id,
      this.name,
      this.phone,
      this.time,
      this.user_id});
  factory MyAppointmentDestroy.fromJson(Map<String, dynamic> json) {
    return MyAppointmentDestroy(
      time: json['time'],
      address: json['address'],
      birthday: json['birthday'],
      diagnosis: json['diagnosis'],
      name: json['name'],
      user_id: json['user_id'],
      phone: json['phone'],
      doctor_id: json['doctor_id'],
    );
  }
  Map<String, dynamic> tojson() {
    Map<String, dynamic> data = new Map<String, dynamic>();
    data['time'] = this.time;
    data['doctor_id'] = this.doctor_id;
    data['phone'] = this.phone;
    data['user_id'] = this.user_id;
    data['diagnosis'] = this.diagnosis;
    data['address'] = this.address;
    data['birthday'] = this.birthday;
    return data;
  }

  @override
  List<Object?> get props =>
      [address, time, phone, birthday, diagnosis, doctor_id, name, user_id];
}
// //  "id": 1,
//         "user_id": 1,
//         "doctor_id": 1,
//         "name": "khaled",
//         "phone": "962812838",
//         "birthday": "2023-03-02",
//         "address": null,
//         "time": "23:15:00",
//         "date": "2023-03-02",
//         "status": "Pending",
//         "diagnosis": null,
//         "deleted_at": "2023-03-31T17:29:24.000000Z",
//         "created_at": "2023-03-31T17:18:32.000000Z",
//         "updated_at": "2023-03-31T17:29:24.000000Z",
//         "doctor": {
//             "id": 1,
//             "name": "mohamadasdqwe",
//             "clinic_id": 1,
//             "deleted_at": null,
//             "created_at": "2023-03-31T17:10:58.000000Z",
//             "updated_at": "2023-03-31T17:10:58.000000Z"
//         }
//     },