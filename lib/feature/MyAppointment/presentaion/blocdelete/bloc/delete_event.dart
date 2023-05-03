part of 'delete_bloc.dart';

abstract class DeleteEvent extends Equatable {
  const DeleteEvent();

  @override
  List<Object> get props => [];
}

class SucDeleteEvent extends DeleteEvent {
  int id;
  SucDeleteEvent({required this.id});
    @override
  List<Object> get props => [id];
}
