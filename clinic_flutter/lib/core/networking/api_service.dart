import 'package:clinic_flutter/core/networking/api_constants.dart';
import 'package:clinic_flutter/features/login/data/models/login_request_body.dart';
import 'package:clinic_flutter/features/login/data/models/login_response.dart';
import 'package:clinic_flutter/features/signup/data/models/sign_up_request_body.dart';
import 'package:clinic_flutter/features/signup/data/models/sign_up_response.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @POST(ApiConstants.login)
  Future<LoginResponse> login(
    @Body() LoginRequestBody body,
  );

  @POST(ApiConstants.signup)
  Future<SignupResponse> signup(
    @Body() SignupRequestBody body,
  );
}
