part of 'nurses_bloc.dart';

abstract class NursesState extends Equatable {
  const NursesState();

  @override
  List<Object> get props => [];
}

class NursesInitial extends NursesState {}

class LoadingNursesState extends NursesState {}

class LoadedNursesState extends NursesState {
  List<NureseData> nursesData;
  LoadedNursesState({required this.nursesData});
}

class ErrorNursesState extends NursesState {
  String massage;
  ErrorNursesState({required this.massage});
}
