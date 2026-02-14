import 'package:dio/dio.dart';
import 'package:goldy/core/error/failures.dart';

class ApiClient {

  final Dio dio;

  ApiClient()
      : dio = Dio(
          BaseOptions(

            headers: {
              "Content-Type": "application/json",
            },
          ),
        ) {

    dio.interceptors.add(
      LogInterceptor(
        requestBody: true,
        responseBody: true,
      ),
    );
  }


  Future<Map<String, dynamic>> post({
    required String url,
    Map<String, dynamic>? data,
    Map<String, dynamic>? query,
  }) async {

    try {
      final res = await dio.post(
        url,
        data: data,
        queryParameters: query,
      );

      return res.data;

    } on DioException catch (e) {
 throw ServerFailure.fromDioError(e);
    }
  }

  Future<Map<String, dynamic>> get({
    required String url,
    Map<String, dynamic>? query,
  }) async {

    try {
      final res = await dio.get(
        url,
        queryParameters: query,
      );

      return res.data;

    } on DioException catch (e) {
       throw ServerFailure.fromDioError(e);
    }
  }


}
