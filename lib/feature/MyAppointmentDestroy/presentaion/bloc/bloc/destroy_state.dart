part of 'destroy_bloc.dart';

abstract class DestroysState extends Equatable {
  const DestroysState();

  @override
  List<Object> get props => [];
}

class DestroyInitial extends DestroysState {}


class SucDestroysState extends DestroysState {
  List<MyAppointmentDestroy> myAppointmentdestroy;
  SucDestroysState({required this.myAppointmentdestroy});
}
class LoadingStateDestroy extends DestroysState {}

class ErrorsDestroyState extends DestroysState {
  String massage;
  ErrorsDestroyState({required this.massage});
}
