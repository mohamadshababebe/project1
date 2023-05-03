import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:my_mydical/feature/AddAppointment/domain/antites/antittes.dart';
import 'package:my_mydical/feature/AddAppointment/domain/usecase/addapontmentusecase.dart';

part 'add_event.dart';
part 'add_state.dart';

class AddBloc extends Bloc<AddEvent, AddState> {
  UseCaseAddAppointment useCaseAddAppointment;
  UsecaseDoctorData usecaseDoctorData;
  UseCaseDoctorTimes useCaseDoctorTime;

  AddBloc(
      {required this.useCaseDoctorTime,
      required this.useCaseAddAppointment,
      required this.usecaseDoctorData})
      : super(AddInitial()) {
    on<GetDoctorEvent>((event, emit) async {
      emit(LoadingAddState());
      try {
        final remotebloctime = await useCaseDoctorTime.call();
        final remotebloc = await usecaseDoctorData.call();

        emit(GetDoctorState(
            times: remotebloctime.times, doctordatas: remotebloc));
      } catch (e) {
        final remotebloctime = await useCaseDoctorTime.call();
        final remotebloc = await usecaseDoctorData.call();
        emit(ErrorsAddState(
            doctordatas: remotebloc, times: remotebloctime.times));
      }
    });

    on<AddAppointmetnEvent>((event, emit) async {
      emit(LoadingAddState());
      try {
        final remotebloc =
            await useCaseAddAppointment.call(event.addDoctorData);
        final remitedoctor = await usecaseDoctorData.call();
        final remotebloctime = await useCaseDoctorTime.call();
        emit(AddApointmentState(
            time: remotebloctime.times, doctordatas: remitedoctor));
      } catch (e) {
        final remotebloctime = await useCaseDoctorTime.call();
        final remoteblocdoctor = await usecaseDoctorData.call();
        emit(ErrorsAddAppointmentState(
            times: remotebloctime.times,
            doctordatas: remoteblocdoctor,
            massage: e.toString()));
      }
    });
  }
}
