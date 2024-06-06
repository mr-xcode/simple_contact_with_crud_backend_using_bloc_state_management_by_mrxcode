import 'package:simple_contact_with_crud_backend_using_bloc_state_maanagement_by_mrxcode/data/apis/api_service.dart';
import 'package:simple_contact_with_crud_backend_using_bloc_state_maanagement_by_mrxcode/data/models/contact.dart';

class ContactRepository {
  final ApiService _apiService;

  ContactRepository({required ApiService apiService})
      : _apiService = apiService;

  Future<List<Contact>> getContact() => _apiService.getContact();
  Future<Contact> addContact(Contact contact) =>
      _apiService.addContact(contact);
  Future<void> updateContact(String id, Contact contact) =>
      _apiService.updateContact(id, contact);
  Future<void> deleteContact(String id) => _apiService.deleteContact(id);
}
