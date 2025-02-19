import 'package:dio/dio.dart';

const String API_KEY = '2a7ce15c-b469-4cf9-8550-b0843c18b071';

class AuthorizationInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers['Authorization'] = API_KEY;
    super.onRequest(options, handler);
  }
}