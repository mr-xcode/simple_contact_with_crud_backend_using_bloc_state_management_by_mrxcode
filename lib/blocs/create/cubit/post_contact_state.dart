part of 'post_contact_cubit.dart';

sealed class PostContactState extends Equatable {
  const PostContactState();

  @override
  List<Object> get props => [];
}

final class PostContactInitial extends PostContactState {}

final class PostContactLoading extends PostContactState {}

final class PostContactSuccess extends PostContactState {}

final class PostContactFail extends PostContactState {
  final String error;

  // ignore: prefer_const_constructors_in_immutables
  PostContactFail({required this.error});

  @override
  // TODO: implement props
  List<Object> get props => [error];
}
