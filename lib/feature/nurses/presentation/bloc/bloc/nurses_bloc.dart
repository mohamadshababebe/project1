import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:my_mydical/feature/nurses/domain/antites/antitesnurs.dart';
import 'package:my_mydical/feature/nurses/domain/usecase/getallnursesusecase.dart';

part 'nurses_event.dart';
part 'nurses_state.dart';

class NursesBloc extends Bloc<NursesEvent, NursesState> {
  GetAllNursesUsesCase getAllNursesUsesCase;
  NursesBloc({required this.getAllNursesUsesCase}) : super(NursesInitial()) {
    on<NursesEvent>((event, emit) async {
      if (event is GetAllNursesEvent) {
        emit(LoadingNursesState());
        final remoteblocwithData = await getAllNursesUsesCase.call();
        remoteblocwithData.fold((l) {
          emit(ErrorNursesState(massage: 'No Data'));
        }, (nursesdata) {
          emit(LoadedNursesState(nursesData: nursesdata));
        });
      } else if (event is RefreshAllNursesEvent) {
        emit(LoadingNursesState());
        final remoteblocwithData = await getAllNursesUsesCase.call();
        remoteblocwithData.fold((l) {
          emit(ErrorNursesState(massage: 'No Data'));
        }, (nursesdata) {
          emit(LoadedNursesState(nursesData: nursesdata));
        });
      }
    });
  }
}
