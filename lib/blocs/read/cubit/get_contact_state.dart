part of 'get_contact_cubit.dart';

sealed class GetContactState extends Equatable {
  const GetContactState();

  @override
  List<Object> get props => [];
}

final class GetContactInitial extends GetContactState {}

final class GetContactSuccess extends GetContactState {
  final List<Contact> contacts;

  GetContactSuccess({required this.contacts});

  @override
  // TODO: implement props
  List<Object> get props => [contacts];
}

final class GetContactFail extends GetContactState {
  final String error;

  GetContactFail({required this.error});

  @override
  // TODO: implement props
  List<Object> get props => [error];
}
