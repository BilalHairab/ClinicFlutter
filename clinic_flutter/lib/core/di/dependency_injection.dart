import 'package:clinic_flutter/core/networking/api_service.dart';
import 'package:clinic_flutter/core/networking/dio_factory.dart';
import 'package:clinic_flutter/features/home/data/apis/home_api_service.dart';
import 'package:clinic_flutter/features/home/data/repos/home_repo.dart';
import 'package:clinic_flutter/features/home/logic/home_cubit.dart';
import 'package:clinic_flutter/features/login/data/repos/login_repo.dart';
import 'package:clinic_flutter/features/login/logic/login_cubit.dart';
import 'package:clinic_flutter/features/signup/logic/sign_up_cubit.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../../features/signup/data/repos/sign_up_repo.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  Dio dio = DioFactory.getDio();
  getIt.registerLazySingleton<ApiService>(() => ApiService(dio));
  //login
  getIt.registerLazySingleton<LoginRepo>(() => LoginRepo(getIt()));
  getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt()));

  //signup
  getIt.registerLazySingleton<SignupRepo>(() => SignupRepo(getIt()));
  getIt.registerFactory<SignupCubit>(() => SignupCubit(getIt()));

  //home
  getIt.registerLazySingleton<HomeApiService>(() => HomeApiService(dio));
  getIt.registerLazySingleton<HomeRepo>(() => HomeRepo(getIt()));
  // getIt.registerFactory<HomeCubit>(() => HomeCubit(getIt()));
}