import 'package:freezed_annotation/freezed_annotation.dart';
part 'api_result.freezed.dart';

//Check also using something called either
@Freezed()
abstract class ApiResult<T> with _$ApiResult<T> {
  const factory ApiResult.success(T data) = Success<T>;
  const factory ApiResult.failure(T data) = Failure<T>;
}