part of 'my_appointment_bloc.dart';

abstract class MyAppointmentState extends Equatable {
  const MyAppointmentState();

  @override
  List<Object> get props => [];
}

class MyAppointmentInitial extends MyAppointmentState {}

class LoadingMyAppointmentState extends MyAppointmentState {}

class MyAppointmentSucState extends MyAppointmentState {
  List<MyAppointmentModel> myappointmentmodel;
  List<DoctorDatas> doctordata;
  List<String> doctortime;
  MyAppointmentSucState(
      {required this.doctortime,required this.doctordata, required this.myappointmentmodel});
}

class ErrorsMyAppointmentState extends MyAppointmentState {
  String massage;
  ErrorsMyAppointmentState({required this.massage});
}
