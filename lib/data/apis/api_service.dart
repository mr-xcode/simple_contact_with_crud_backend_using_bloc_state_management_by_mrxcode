import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';
import 'package:simple_contact_with_crud_backend_using_bloc_state_management_by_mrxcode/data/models/contact.dart';
part 'api_service.g.dart';

@RestApi(
    baseUrl:
        'https://crudcrud.com/api/43c5ed5803ef405dacd42ba0a6b722de/contacts/')
abstract class ApiService {
  factory ApiService(Dio dio) => _ApiService(dio);

  @GET('')
  Future<List<Contact>> getContact();

  @POST('')
  Future<Contact> addContact(@Body() Contact contact);

  @PUT('/{id}')
  Future<void> updateContact(@Path() String id, @Body() Contact contact);

  @DELETE('/{id}')
  Future<void> deleteContact(@Path() String id);
}
