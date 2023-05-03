import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:my_mydical/feature/Doctors/domain/antites/DoctorData.dart';
import 'package:my_mydical/feature/Doctors/domain/usecase/getalldatadoctor.dart';

part 'doctor_event.dart';
part 'doctor_state.dart';

class DoctorBloc extends Bloc<DoctorEvent, DoctorState> {
  GetAllDoctorUseCase getalldatausecase;
  DoctorBloc({required this.getalldatausecase}) : super(DoctorInitial()) {
    on<DoctorEvent>((event, emit) async {
      if (event is GetAllDoctorEvent) {
        emit(LoadingDoctorState());
        Future.delayed(Duration(seconds: 2));
        final remoteblocwithapi = await getalldatausecase.call();
        remoteblocwithapi.fold((l) {
          emit(ErrorDoctorState(massage: 'you cant doit'));
        }, (doctordata) {
          emit(GetAllDoctorState(doctordata: doctordata));
        });
      }else if(event is RefreshAllEvent){
          emit(LoadingDoctorState());
        Future.delayed(Duration(seconds: 2));
        final remoteblocwithapi = await getalldatausecase.call();
        remoteblocwithapi.fold((l) {
          emit(ErrorDoctorState(massage: 'you cant doit'));
        }, (doctordata) {
          emit(GetAllDoctorState(doctordata: doctordata));
        });
      }
    });
  }
}
