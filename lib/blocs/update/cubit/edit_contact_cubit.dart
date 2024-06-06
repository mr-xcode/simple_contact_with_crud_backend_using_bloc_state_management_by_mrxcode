// ignore: depend_on_referenced_packages
import 'package:Contact_Plus/data/contact_repository.dart';
import 'package:Contact_Plus/data/models/contact.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
part 'edit_contact_state.dart';

class EditContactCubit extends Cubit<EditContactState> {
  final ContactRepository _contactRepository;
  EditContactCubit(this._contactRepository) : super(EditContactInitial());

  void editContact(String id, Contact contact) {
    emit(EditContactLoading());
    _contactRepository
        .updateContact(id, contact)
        .then((value) => emit(EditContactSuccess()))
        .catchError((e) => emit(EditContactFail(error: e.toString())));
  }
}
