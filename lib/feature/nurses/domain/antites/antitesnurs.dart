import 'package:equatable/equatable.dart';

class NureseData extends Equatable {
  int id;
  String name;
  int phone;
  String image;

  String description;

  NureseData(
      {required this.image,
      required this.id,
      required this.name,
      required this.phone,
      required this.description});
  @override
  List<Object?> get props => [id, name, phone, description];
}
