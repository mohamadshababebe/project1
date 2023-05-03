import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:my_mydical/feature/MyAppointment/domain/antites/antites.dart';
import 'package:my_mydical/feature/MyAppointment/domain/usecase/usecase.dart';

part 'my_appointment_event.dart';
part 'my_appointment_state.dart';

class MyAppointmentBloc extends Bloc<MyAppointmentEvent, MyAppointmentState> {
  UsecaseMyAppointment usecaseMyAppointment;
  UsecaseDoctorDatas usecaseDoctorData;
  UseCaseDoctorTime useCaseDoctorTime;

  MyAppointmentBloc(
      {required this.usecaseDoctorData,
      required this.usecaseMyAppointment,
      required this.useCaseDoctorTime})
      : super(MyAppointmentInitial()) {
    on<MyAppointmentEventSuc>((event, emit) async {
      emit(LoadingMyAppointmentState());
      try {
        final remotetime = await useCaseDoctorTime.call();
        final remoteblocwithapiDoctor = await usecaseDoctorData.call();
        final remoteblocwithapi = await usecaseMyAppointment.call();
        emit(MyAppointmentSucState(
            doctordata: remoteblocwithapiDoctor,
            myappointmentmodel: remoteblocwithapi,
            doctortime: remotetime.times));
      } catch (e) {
        emit(ErrorsMyAppointmentState(massage: e.toString()));
      }
    });
  }
}
