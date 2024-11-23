import 'package:clinic_flutter/core/networking/api_error_handler.dart';
import 'package:clinic_flutter/core/networking/api_result.dart';
import 'package:clinic_flutter/features/home/data/apis/home_api_service.dart';
import 'package:clinic_flutter/features/home/data/models/specializations_response_model.dart';

class HomeRepo {
  final HomeApiService _homeApiService;

  HomeRepo(this._homeApiService);

  Future<ApiResult<SpecializationsResponseModel>> getSpecializations() async {
    try {
      final response = await _homeApiService.getSpecializations();
      return ApiResult.success(response);
    } catch(e) {
      return ApiResult.failure(ErrorHandler.handle(e));
    }
  }
}