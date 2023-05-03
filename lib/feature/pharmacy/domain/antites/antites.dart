import 'package:equatable/equatable.dart';

class DataPharmcay extends Equatable {
  int id;
  String name;
  int prise;
  String description;
  DataPharmcay(
      {required this.description,
      required this.id,
      required this.name,
      required this.prise});
  factory DataPharmcay.fromJson(Map<String, dynamic> json) {
    return DataPharmcay(
        description: json['description'],
        id: json['id'],
        name: json['name'],
        prise: json['prise']);
  }
  Map<String, dynamic> tojson() {
    return {
      'id': id,
      'name': name,
      'prise': prise,
      'description': description,
    };
  }

  @override
  List<Object?> get props => [id, name, prise, description];
}
