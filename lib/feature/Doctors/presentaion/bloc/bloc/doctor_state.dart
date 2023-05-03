part of 'doctor_bloc.dart';

abstract class DoctorState extends Equatable {
  const DoctorState();

  @override
  List<Object> get props => [];
}

class DoctorInitial extends DoctorState {}

class LoadingDoctorState extends DoctorState {}

class GetAllDoctorState extends DoctorState {
  List<DoctorData> doctordata;
  GetAllDoctorState({required this.doctordata});
}

class ErrorDoctorState extends DoctorState {
  String massage;
  ErrorDoctorState({required this.massage});
}
