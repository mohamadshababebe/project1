import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:my_mydical/feature/MyAppointment/domain/antites/antites.dart';
import 'package:my_mydical/feature/MyAppointment/domain/usecase/usecase.dart';

part 'delete_event.dart';
part 'delete_state.dart';

class DeleteBloc extends Bloc<DeleteEvent, DeleteState> {
  UsecaseDeleteAppointment usecaseDeleteAppointment;
  DeleteBloc({required this.usecaseDeleteAppointment})
      : super(DeleteInitial()) {
    on<SucDeleteEvent>((event, emit) async {
      emit(LoadingDeleteState());
      final remotebloc = await usecaseDeleteAppointment.call(event.id);
      remotebloc.fold((l) {
        emit(ErrorsDeleteState(massage: l.toString()));
      }, (r) {
        emit(SucDeleteState());
      });
    });
  }
}
