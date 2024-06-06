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

  PostContactFail({required this.error});

  @override
  // TODO: implement props
  List<Object> get props => [error];
}
