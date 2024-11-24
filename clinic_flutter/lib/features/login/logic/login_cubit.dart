import 'package:clinic_flutter/core/helpers/constants.dart';
import 'package:clinic_flutter/core/helpers/shared_pref_helper.dart';
import 'package:clinic_flutter/core/networking/api_error_handler.dart';
import 'package:clinic_flutter/core/networking/dio_factory.dart';
import 'package:clinic_flutter/features/login/data/models/login_request_body.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import './login_state.dart';
import '../data/repos/login_repo.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepo _loginRepo;

  LoginCubit(this._loginRepo) : super(const LoginState.initial());

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  void emitLoginState() async {
    emit(const LoginState.loading());
    final response = await _loginRepo.login(LoginRequestBody(email: emailController.text,
        password: passwordController.text));

    response.when(success: (loginResponse) async {
      if(loginResponse.userData?.token == null) {
        emit(LoginState.error(ApiErrorHandler.handle("Invalid Login")));
        return;
      }
      await saveUserToken(loginResponse.userData!.token!);
      emit(LoginState.success(loginResponse));
    }, failure: (apiErrorModel) {
      emit(LoginState.error(apiErrorModel));
    });
  }

  saveUserToken(String token) async {
    await SharedPrefHelper.setSecuredString(SharedPrefKeys.userToken, token);
    DioFactory.setTokenIntoHeaderAfterLogin(token);
  }
}
