part of 'destroy_bloc.dart';

abstract class DestroysEvent extends Equatable {
  const DestroysEvent();

  @override
  List<Object> get props => [];
}

class MyDestroyEvent extends DestroysEvent {}
