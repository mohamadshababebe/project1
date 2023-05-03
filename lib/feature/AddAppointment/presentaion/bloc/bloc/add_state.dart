part of 'add_bloc.dart';

abstract class AddState extends Equatable {
  const AddState();

  @override
  List<Object> get props => [];
}

class AddInitial extends AddState {}

class GetDoctorState extends AddState {
  final List<DoctorDatas> doctordatas;
  final List<String> times;
  const GetDoctorState({required this.times, required this.doctordatas});
  @override
  List<Object> get props => [doctordatas, times];
}

class AddApointmentState extends AddState {
  AddApointmentState({this.doctordatas, this.time});
  List<String>? time;
  List<DoctorDatas>? doctordatas;
}

class LoadingAddState extends AddState {}

class ErrorsAddState extends AddState {
  List<DoctorDatas> doctordatas;
  final List<String> times;

  ErrorsAddState({required this.times, required this.doctordatas});
}

class ErrorsAddAppointmentState extends AddState {
  List<DoctorDatas>? doctordatas;
  List<String>? times;

  String massage;
  ErrorsAddAppointmentState(
      {this.doctordatas, this.times, required this.massage});
}
