import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:simple_contact_with_crud_backend_using_bloc_state_maanagement_by_mrxcode/blocs/read/cubit/get_contact_cubit.dart';
import 'package:simple_contact_with_crud_backend_using_bloc_state_maanagement_by_mrxcode/data/apis/api_service.dart';
import 'package:simple_contact_with_crud_backend_using_bloc_state_maanagement_by_mrxcode/data/contact_repository.dart';

var getIt = GetIt.I;

void locator() {
  Dio dio = Dio();
  getIt.registerLazySingleton(() => dio);

  ApiService apiService = ApiService(getIt.call());
  getIt.registerLazySingleton(() => apiService);

  ContactRepository contactRepository =
      ContactRepository(apiService: getIt.call());
  getIt.registerLazySingleton(() => contactRepository);

  GetContactCubit getContactCubit = GetContactCubit(getIt.call());
  getIt.registerLazySingleton(() => getContactCubit);
}
