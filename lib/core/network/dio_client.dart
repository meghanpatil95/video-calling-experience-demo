import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:video_calling_experience_demo/core/utils/app_logger.dart';

import '../constants/app_config.dart';

class DioClient {
  DioClient._();

  static final Dio instance =
      Dio(
          BaseOptions(
            baseUrl: AppConfig.baseUrl,
            connectTimeout: const Duration(seconds: 30),
            receiveTimeout: const Duration(seconds: 30),
            headers: {
              "Content-Type": "application/json",
              "Accept": "application/json",
              "x-api-key": AppConfig.apiKey,
            },
          ),
        )
        ..interceptors.add(
          PrettyDioLogger(requestBody: true, responseBody: true),
        )
        ..interceptors.add(
          InterceptorsWrapper(
            onError: (error, handler) {
              AppLogger.logger.e(error.message);

              handler.next(error);
            },
          ),
        );
}
