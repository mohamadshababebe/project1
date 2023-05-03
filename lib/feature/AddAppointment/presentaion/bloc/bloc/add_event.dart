part of 'add_bloc.dart';

abstract class AddEvent extends Equatable {
  const AddEvent();

  @override
  List<Object> get props => [];
}
class AddAppointmetnEvent extends AddEvent {
  AddDoctorData addDoctorData;
  AddAppointmetnEvent({required this.addDoctorData});
}

class GetDoctorEvent extends AddEvent {}
class RefreshEvent extends AddEvent{}

