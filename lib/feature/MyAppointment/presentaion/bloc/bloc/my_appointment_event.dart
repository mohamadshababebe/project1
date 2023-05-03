part of 'my_appointment_bloc.dart';

abstract class MyAppointmentEvent extends Equatable {
  const MyAppointmentEvent();

  @override
  List<Object> get props => [];
}

class MyAppointmentEventSuc extends MyAppointmentEvent {}
