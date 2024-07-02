import 'package:dio/dio.dart';
import 'package:palm_code_assessment/data/api_service_interface.dart';

class DioPackage implements ApiServiceInterface {
  final dio = Dio();

  DioPackage() {
    dio.options.baseUrl = 'https://gutendex.com';
    dio.options.connectTimeout = const Duration(seconds: 5);
    dio.options.receiveTimeout = const Duration(seconds: 3);
  }

  @override
  Future<T?> get<T>(String url) async {
    var response = await dio.get<T>(url);
    return response.data;
  }
}
