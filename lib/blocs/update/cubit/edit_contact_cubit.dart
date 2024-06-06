import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:simple_contact_with_crud_backend_using_bloc_state_management_by_mrxcode/data/contact_repository.dart';
import 'package:simple_contact_with_crud_backend_using_bloc_state_management_by_mrxcode/data/models/contact.dart';
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
