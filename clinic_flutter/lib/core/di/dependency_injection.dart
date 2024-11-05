import 'package:clinic_flutter/core/networking/api_service.dart';
import 'package:clinic_flutter/core/networking/dio_factory.dart';
import 'package:clinic_flutter/features/login/data/repos/login_repo.dart';
import 'package:clinic_flutter/features/login/logic/login_cubit.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  Dio dio = DioFactory.getDio();
  getIt.registerLazySingleton<ApiService>(() => ApiService(dio));

  getIt.registerLazySingleton<LoginRepo>(() => LoginRepo(getIt()));
  getIt.registerLazySingleton<LoginCubit>(() => LoginCubit(getIt()));


}