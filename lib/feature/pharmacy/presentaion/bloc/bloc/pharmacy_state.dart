part of 'pharmacy_bloc.dart';

abstract class PharmacyState extends Equatable {
  const PharmacyState();

  @override
  List<Object> get props => [];
}

class PharmacyInitial extends PharmacyState {}

class LoadingPharmacy extends PharmacyState {}

class GetallPharmacyState extends PharmacyState {
  final List<DataPharmcay> dataPharmacy;
  GetallPharmacyState({required this.dataPharmacy});
}

class ErrorPharmacyState extends PharmacyState {
  String massage;
  ErrorPharmacyState({required this.massage});
}
