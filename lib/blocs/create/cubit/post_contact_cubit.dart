import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:simple_contact_with_crud_backend_using_bloc_state_maanagement_by_mrxcode/data/contact_repository.dart';
import 'package:simple_contact_with_crud_backend_using_bloc_state_maanagement_by_mrxcode/data/models/contact.dart';

part 'post_contact_state.dart';

class PostContactCubit extends Cubit<PostContactState> {
  final ContactRepository _contactRepository;
  PostContactCubit(this._contactRepository) : super(PostContactInitial());

  void addContact(Contact contact) {
    emit(PostContactLoading());
    _contactRepository
        .addContact(contact)
        .then((value) => emit(PostContactSuccess()))
        .catchError((e) => emit(PostContactFail(error: e)));
  }
}
