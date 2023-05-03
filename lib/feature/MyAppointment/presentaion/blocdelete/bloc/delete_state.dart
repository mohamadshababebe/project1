part of 'delete_bloc.dart';

abstract class DeleteState extends Equatable {
  const DeleteState();

  @override
  List<Object> get props => [];
}

class DeleteInitial extends DeleteState {}

class LoadingDeleteState extends DeleteState {}

class SucDeleteState extends DeleteState {}

class ErrorsDeleteState extends DeleteState {
  String massage;
  ErrorsDeleteState({required this.massage});
}
