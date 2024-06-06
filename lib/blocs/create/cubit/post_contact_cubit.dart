// ignore: depend_on_referenced_packages
import 'package:Contact_Plus/data/contact_repository.dart';
import 'package:Contact_Plus/data/models/contact.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'post_contact_state.dart';

class PostContactCubit extends Cubit<PostContactState> {
  final ContactRepository _contactRepository;
  PostContactCubit(this._contactRepository) : super(PostContactInitial());

  void addContact(Contact contact) {
    emit(PostContactLoading());
    _contactRepository
        .addContact(contact)
        .then((value) => emit(PostContactSuccess()))
        .catchError((e) => emit(PostContactFail(error: e.toString())));
  }
}
