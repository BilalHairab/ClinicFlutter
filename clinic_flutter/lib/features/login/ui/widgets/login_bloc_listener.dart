import 'package:clinic_flutter/core/helpers/extensions.dart';
import 'package:clinic_flutter/core/networking/api_error_model.dart';
import 'package:clinic_flutter/core/routing/routes.dart';
import 'package:clinic_flutter/core/theming/colors.dart';
import 'package:clinic_flutter/features/login/logic/login_cubit.dart';
import 'package:clinic_flutter/features/login/logic/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/theming/styles.dart';

class LoginBlocListener extends StatelessWidget {
  const LoginBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listener: (context, state) {
        state.whenOrNull(
            loading: () {
              showDialog(
                  context: context,
                  builder: (context) => const Center(
                        child: CircularProgressIndicator(
                          color: ColorsManager.mainBlue,
                        ),
                      ));
            },
            success: (loginResponse) {
              //dismiss dialog
              context.pop();
              context.pushNamed(Routes.homeScreen);
            },
            error: (apiErrorModel) {
              setupErrorState(context, apiErrorModel);
            });
      },
      listenWhen: (previous, current) => current is Loading || current is Success || current is Error,
      child: const SizedBox.shrink(),
    );
  }

  void setupErrorState(BuildContext context, ApiErrorModel apiErrorModel) {
    context.pop();
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        icon: const Icon(
          Icons.error,
          color: Colors.red,
          size: 32,
        ),
        content: Text(
          apiErrorModel.getAllErrorMessages(),
          style: TextStyles.font15DarkBlueMedium,
        ),
        actions: [
          TextButton(
            onPressed: () {
              context.pop();
            },
            child: Text(
              'Got it',
              style: TextStyles.font14BlueSemiBold,
            ),
          ),
        ],
      ),
    );
  }
}
