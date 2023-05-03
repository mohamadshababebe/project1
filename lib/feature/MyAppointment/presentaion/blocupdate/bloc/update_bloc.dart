import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:my_mydical/feature/MyAppointment/domain/antites/antites.dart';
import 'package:my_mydical/feature/MyAppointment/domain/usecase/usecase.dart';

part 'update_event.dart';
part 'update_state.dart';

class UpdateBloc extends Bloc<UpdateEvent, UpdateState> {
  UseCaseUpdateAppointment useCaseUpdateAppointment;
  UsecaseMyAppointment usecaseMyAppointment;
  UsecaseDoctorDatas usecaseDoctorDatas;
  UseCaseDoctorTime useCaseDoctorTime;
  UpdateBloc(
      {required this.useCaseDoctorTime,
      required this.usecaseMyAppointment,
      required this.usecaseDoctorDatas,
      required this.useCaseUpdateAppointment})
      : super(UpdateInitial()) {
    on<RemtotewithDataEvent>((event, emit) async {
      emit(LoadingUpdate());
      try {
        final remotebloc =
            await useCaseUpdateAppointment.call(event.myAppointmentModel);
        emit(SucUpdateState());
      } catch (e) {
        emit(ErrorsUpdate(massage: e.toString()));
      }
    });
    on<SucUpdateEvent>((event, emit) async {
      emit(LoadingUpdate());
      try {
        final remotetime = await useCaseDoctorTime.call();
        final remotedoctor = await usecaseDoctorDatas.call();
        emit(BlaBlaState(
          myAppointmentModel: event.myAppointmentModel,
          doctorDatas: remotedoctor,
          times: remotetime.times,
        ));
      } catch (e) {
        throw Exception();
      }
    });
  }
}
