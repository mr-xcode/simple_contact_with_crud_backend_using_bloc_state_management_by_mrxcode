part of 'get_contact_cubit.dart';

sealed class GetContactState extends Equatable {
  const GetContactState();

  @override
  List<Object> get props => [];
}

final class GetContactInitial extends GetContactState {}

final class GetContactSuccess extends GetContactState {
  final List<Contact> contacts;

  // ignore: prefer_const_constructors_in_immutables
  GetContactSuccess({required this.contacts});

  @override
  // TODO: implement props
  List<Object> get props => [contacts];
}

final class GetContactFail extends GetContactState {
  final String error;

  // ignore: prefer_const_constructors_in_immutables
  GetContactFail({required this.error});

  @override
  // TODO: implement props
  List<Object> get props => [error];
}
