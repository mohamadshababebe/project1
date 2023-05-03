part of 'pharmacy_bloc.dart';

abstract class PharmacyEvent extends Equatable {
  const PharmacyEvent();

  @override
  List<Object> get props => [];
}

class GetallPharmecyEvent extends PharmacyEvent {}
class RefreshAllPharmacyEvent extends PharmacyEvent{}
