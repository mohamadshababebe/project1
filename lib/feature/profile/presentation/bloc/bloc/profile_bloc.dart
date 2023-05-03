import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:my_mydical/feature/profile/domain/usecase/usecaseprofile.dart';

import '../../../domain/antites/antitesprofile.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  UseCaseProfile useCaseProfile;

  ProfileBloc({required this.useCaseProfile}) : super(ProfileInitial()) {
    on<SucProfileEvent>((event, emit) async {
      emit(LoadingProfileStete());
      final remotebloc = await useCaseProfile.call();
      remotebloc.fold((l) {
        emit(ErrorsProfileData(massage: l.toString()));
      }, (r) {
        emit(SucProfileState(dataProfile: r));
      });
    });
  }
}
