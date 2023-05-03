part of 'profile_bloc.dart';

abstract class ProfileState extends Equatable {
  const ProfileState();

  @override
  List<Object> get props => [];
}

class ProfileInitial extends ProfileState {}

class LoadingProfileStete extends ProfileState {}

class SucProfileState extends ProfileState {
 DataProfile dataProfile;
  SucProfileState({required this.dataProfile});
}

class ErrorsProfileData extends ProfileState {
  String massage;
  ErrorsProfileData({required this.massage});
}
