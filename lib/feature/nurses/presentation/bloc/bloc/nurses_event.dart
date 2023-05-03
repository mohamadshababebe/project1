part of 'nurses_bloc.dart';

abstract class NursesEvent extends Equatable {
  const NursesEvent();

  @override
  List<Object> get props => [];
}

class GetAllNursesEvent extends NursesEvent {}

class RefreshAllNursesEvent extends NursesEvent {}
