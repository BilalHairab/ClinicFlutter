import 'package:clinic_flutter/core/networking/api_constants.dart';
import 'package:clinic_flutter/features/login/data/models/login_request_body.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @POST(ApiConstants.login)
  Future<String> login(
    @Body() LoginRequestBody body,
  );
}
