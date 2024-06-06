import 'package:Contact_Plus/blocs/read/cubit/get_contact_cubit.dart';
import 'package:Contact_Plus/data/apis/api_service.dart';
import 'package:Contact_Plus/data/contact_repository.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

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
