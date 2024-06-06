import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';
import 'package:simple_contact_with_crud_backend_using_bloc_state_maanagement_by_mrxcode/data/models/contact.dart';

part 'api_service.g.dart';

@RestApi(
    baseUrl:
        'https://crudcrud.com/api/ebc89bbbf8f74740af9ff2df106daee3/contacts/')
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
