import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:my_mydical/feature/pharmacy/domain/antites/antites.dart';
import 'package:my_mydical/feature/pharmacy/domain/usecase/usecasepharmcy.dart';

part 'pharmacy_event.dart';
part 'pharmacy_state.dart';

class PharmacyBloc extends Bloc<PharmacyEvent, PharmacyState> {
  getallPharmacyUsecase getallPharmacyusecase;

  PharmacyBloc({required this.getallPharmacyusecase})
      : super(PharmacyInitial()) {
    on<PharmacyEvent>((event, emit) async {
      if (event is GetallPharmecyEvent) {
        emit(LoadingPharmacy());
        final remoteblocwithapi = await getallPharmacyusecase.call();
        remoteblocwithapi.fold((l) {
          emit(ErrorPharmacyState(massage: l.toString()));
        }, (datapharmacy) {
          emit(GetallPharmacyState(dataPharmacy: datapharmacy));
        });
      } else if (event is RefreshAllPharmacyEvent) {
        emit(LoadingPharmacy());
        final remoteblocwithapi = await getallPharmacyusecase.call();
        remoteblocwithapi.fold((l) {
          emit(ErrorPharmacyState(massage: l.toString()));
        }, (datapharmacy) {
          emit(GetallPharmacyState(dataPharmacy: datapharmacy));
        });
      }
    });
  }
}
