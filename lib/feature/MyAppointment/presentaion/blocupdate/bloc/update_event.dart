part of 'update_bloc.dart';

abstract class UpdateEvent extends Equatable {
  const UpdateEvent();

  @override
  List<Object> get props => [];
}

class SucUpdateEvent extends UpdateEvent {
  MyAppointmentModel myAppointmentModel;
  SucUpdateEvent({required this.myAppointmentModel});
}

class RemtotewithDataEvent extends UpdateEvent {
  MyAppointmentModel myAppointmentModel;
  RemtotewithDataEvent({required this.myAppointmentModel});
}
