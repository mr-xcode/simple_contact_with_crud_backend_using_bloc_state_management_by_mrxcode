// ignore: depend_on_referenced_packages
import 'package:Contact_Plus/data/contact_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../data/models/contact.dart';

part 'get_contact_state.dart';

class GetContactCubit extends Cubit<GetContactState> {
  final ContactRepository _contactRepository;
  GetContactCubit(this._contactRepository) : super(GetContactInitial()) {
    getContact();
  }

  void getContact() {
    emit(GetContactInitial());

    _contactRepository
        .getContact()
        .then((value) => emit(GetContactSuccess(contacts: value)))
        .catchError((e) => emit(GetContactFail(error: e.toString())));
  }

  void deleteContact(String id) {
    _contactRepository
        .deleteContact(id)
        .then((value) => getContact())
        .catchError((e) => emit(GetContactFail(error: 'Cannot delete')));
  }
}
