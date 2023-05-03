part of 'update_bloc.dart';

abstract class UpdateState extends Equatable {
  const UpdateState();

  @override
  List<Object> get props => [];
}

class UpdateInitial extends UpdateState {}

class LoadingUpdate extends UpdateState {}

class SucUpdateState extends UpdateState {}

class ErrorsUpdate extends UpdateState {
  String massage;
  ErrorsUpdate({required this.massage});
}

class BlaBlaState extends UpdateState {
  MyAppointmentModel myAppointmentModel;
  List<DoctorDatas> doctorDatas;
  List<String> times;
  BlaBlaState({required this.times,required this.doctorDatas, required this.myAppointmentModel});

  @override
  List<Object> get props => [myAppointmentModel, doctorDatas];
}
