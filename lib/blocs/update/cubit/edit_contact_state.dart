part of 'edit_contact_cubit.dart';

sealed class EditContactState extends Equatable {
  const EditContactState();

  @override
  List<Object> get props => [];
}

final class EditContactInitial extends EditContactState {}

final class EditContactLoading extends EditContactState {}

final class EditContactSuccess extends EditContactState {}

final class EditContactFail extends EditContactState {
  final String error;

  EditContactFail({required this.error});

  @override
  // TODO: implement props
  List<Object> get props => [error];
}
