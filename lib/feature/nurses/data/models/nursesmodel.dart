import 'package:my_mydical/feature/nurses/domain/antites/antitesnurs.dart';

class NursesModel extends NureseData {
  NursesModel(
      {required super.id,
      required super.image,
      required super.name,
      required super.phone,
      required super.description});
  factory NursesModel.fromJson(Map<String, dynamic> json) {
    return NursesModel(
        image: json['image'],
        id: json['id'],
        name: json['name'],
        phone: json['phone'],
        description: json['description']);
  }
  Map<String, dynamic> tojson() {
    return {
      'id': id,
      'image': image,
      'name': name,
      'phone': phone,
      'description': description
    };
  }
}
