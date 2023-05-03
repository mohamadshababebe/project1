import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:my_mydical/feature/MyAppointmentDestroy/domain/usecase/usecase.dart';

import '../../../domain/antites/antites.dart';

part 'destroy_event.dart';
part 'destroy_state.dart';

class DestroysBloc extends Bloc<DestroysEvent, DestroysState> {
  UseCaseMyAppointemetDestroy useCaseMyAppointemetDestroy;

  DestroysBloc({required this.useCaseMyAppointemetDestroy})
      : super(DestroyInitial()) {
    on<MyDestroyEvent>((event, emit) async {
      emit(LoadingStateDestroy());
      try {
        final remotebloc = await useCaseMyAppointemetDestroy.call();
        emit(SucDestroysState(myAppointmentdestroy: remotebloc));
      } catch (e) {
        emit(ErrorsDestroyState(massage: e.toString()));
      }
    });
  }
}
