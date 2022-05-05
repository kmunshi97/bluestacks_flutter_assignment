import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

export 'package:logger/logger.dart';

class DIOHelper {
  final Dio _dio = Dio();
  Logger logger = Logger();

  Future<Response> getAPIData({
    required String endpoint,
    Map<String, dynamic>? queryparams = const {},
  }) async {
    try {
      Response response = await _dio.get(
        endpoint,
        queryParameters: queryparams,
      );

      return response;
    } catch (_err, _stacktrace) {
      logger.i(
        "API error: \n  Endpoint: $endpoint \n  Queryparams: $queryparams",
      );
      logger.e(_err);
      logger.e(_stacktrace);
      throw Future.error("An error occurred, please try again later.");
    }
  }
}
