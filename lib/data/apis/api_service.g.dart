// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_service.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers

class _ApiService implements ApiService {
  _ApiService(
    this._dio, {
    // ignore: unused_element
    this.baseUrl,
  }) {
    baseUrl ??=
        'https://crudcrud.com/api/43c5ed5803ef405dacd42ba0a6b722de/contacts/';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<List<Contact>> getContact() async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _result =
        await _dio.fetch<List<dynamic>>(_setStreamType<List<Contact>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    var value = _result.data!
        .map((dynamic i) => Contact.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  @override
  Future<Contact> addContact(Contact contact) async {
    Dio dio = Dio();
    String url =
        'https://crudcrud.com/api/43c5ed5803ef405dacd42ba0a6b722de/contacts/';

    Map<String, dynamic> data = {
      'firstName': contact.firstName,
      'lastName': contact.lastName,
      'nickName': contact.nickName,
      'dateOfBirth': contact.dateOfBirth,
      'gender': contact.gender,
      'phone': contact.phone,
      'email': contact.email,
      'address': contact.address,
    };

    try {
      // Make the PUT request
      Response response = await dio.post(
        url,
        data: data,
        options: Options(
          headers: {
            'Content-Type': 'application/json',
          },
        ),
      );

      // Check the response status code
      if (response.statusCode == 200) {
        return Contact.fromJson(response.data);
      } else {}
    } catch (e) {
      if (e is DioException) {
      } else {}
    }

    return Contact(
        id: '',
        firstName: 'dummyName',
        lastName: 'dummyLastName',
        nickName: 'dummyNickName',
        dateOfBirth: 'dummyDOB',
        gender: 'dummyGender',
        phone: 'dummyPhone',
        email: 'dummyEmail',
        address: 'dummyAddress');
  }

  @override
  Future<void> updateContact(
    String id,
    Contact contact,
  ) async {
    Dio dio = Dio();
    String url =
        'https://crudcrud.com/api/43c5ed5803ef405dacd42ba0a6b722de/contacts/${id}';

    // Define the data to be updated
    Map<String, dynamic> data = {
      'firstName': contact.firstName,
      'lastName': contact.lastName,
      'nickName': contact.nickName,
      'dateOfBirth': contact.dateOfBirth,
      'gender': contact.gender,
      'phone': contact.phone,
      'email': contact.email,
      'address': contact.address,
    };

    try {
      // Make the PUT request
      Response response = await dio.put(
        url,
        data: data,
        options: Options(
          headers: {
            'Content-Type': 'application/json',
          },
        ),
      );

      // Check the response status code
      if (response.statusCode == 200) {
      } else {}
    } catch (e) {
      if (e is DioException) {
      } else {}
    }
  }

  @override
  Future<void> deleteContact(String id) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    await _dio.fetch<void>(_setStreamType<void>(Options(
      method: 'DELETE',
      headers: _headers,
      extra: _extra,
    )
        .compose(
          _dio.options,
          '/${id}',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(
            baseUrl: _combineBaseUrls(
          _dio.options.baseUrl,
          baseUrl,
        ))));
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }

  String _combineBaseUrls(
    String dioBaseUrl,
    String? baseUrl,
  ) {
    if (baseUrl == null || baseUrl.trim().isEmpty) {
      return dioBaseUrl;
    }

    final url = Uri.parse(baseUrl);

    if (url.isAbsolute) {
      return url.toString();
    }

    return Uri.parse(dioBaseUrl).resolveUri(url).toString();
  }
}
