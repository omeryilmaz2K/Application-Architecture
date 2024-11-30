import 'dart:io';

import 'package:dio/dio.dart';

import '../../base/model/base_model.dart';

final class NetworkManager {
  static final NetworkManager _instance = NetworkManager._init();

  static NetworkManager get instance => _instance;

  late Dio _dio;

  NetworkManager._init() {
    final baseOptions = BaseOptions(
      baseUrl: 'https://jsonplaceholder.typicode.com/',
    );

    _dio = Dio(baseOptions);

    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          //? Request sırasında ortak işlemleri yapabiliriz.
          //? options.path += '2K';
        },
        onResponse: (response, handler) {
          //? Response olarak base bir model dönüyorsak
          //? burada base model'e parse edebiliriz.
        },
        onError: (error, handler) {
          //? her gelen error için base bir senaryonuz olması durumunda
          //? Base bir mesaj veya base bir error döndürebiliriz.
          //? return BaseError(message: error.message);
        },
      ),
    );
  }

  Future dioGet<T extends BaseModel>(String path, T model) async {
    final response = await _dio.get(path);

    switch (response.statusCode) {
      case HttpStatus.ok:
        final responseBody = response.data;

        if (responseBody is List) {
          return responseBody
              .map(
                (e) => model.fromJson(e),
              )
              .toList();
        } else if (responseBody is Map<String, dynamic>) {
          final map = model.fromJson(responseBody);
          return map;
        }

        return responseBody;
    }
  }
}
