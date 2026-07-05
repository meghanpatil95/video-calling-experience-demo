import 'package:dio/dio.dart';

import '../errors/api_exception.dart';
import 'dio_client.dart';

class NetworkService {
  final Dio _dio = DioClient.instance;

  Future<Map<String, dynamic>> post(
      String path, {
        dynamic data,
      }) async {
    try {
      final response = await _dio.post(
        path,
        data: data,
      );

      return response.data;
    } on DioException catch (e) {
      throw ApiException(
        e.response?.data["message"] ??
            "Something went wrong",
      );
    }
  }
}