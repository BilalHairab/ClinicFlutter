import 'package:clinic_flutter/core/helpers/extensions.dart';
import 'package:clinic_flutter/core/theming/styles.dart';
import 'package:clinic_flutter/core/widgets/app_text_button.dart';
import 'package:clinic_flutter/features/login/logic/login_cubit.dart';
import 'package:clinic_flutter/features/login/ui/widgets/dont_have_account_text.dart';
import 'package:clinic_flutter/features/login/ui/widgets/email_and_password.dart';
import 'package:clinic_flutter/features/login/ui/widgets/login_bloc_listener.dart';
import 'package:clinic_flutter/features/login/ui/widgets/terms_and_conditions_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 30.h),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Welcome Back",
                  style: TextStyles.font24BlueBold,
                ),
                8.0.toVerticalSpacing(),
                Text(
                  "We're excited to have you back, can't wait to see what you've been up to since you last logged in.",
                  style: TextStyles.font14GrayRegular,
                ),
                36.0.toVerticalSpacing(),
                Column(
                  children: [
                    const EmailAndPassword(),
                    //Use Align if we want to disagree with the parent widget's align
                    Align(
                      alignment: AlignmentDirectional.centerEnd,
                      child: Text(
                        "Forgot Password?",
                        style: TextStyles.font13BlueRegular,
                      ),
                    ),
                    40.0.toVerticalSpacing(),
                    AppTextButton(
                      buttonText: "Login",
                      textStyle: TextStyles.font16WhiteSemiBold,
                      onPressed: () {
                        validateThenDoLogin(context);
                      },
                    ),
                    16.0.toVerticalSpacing(),
                    const TermsAndConditionsText(),
                    60.0.toVerticalSpacing(),
                    const DontHaveAccountText(),
                    const LoginBlocListener(),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void validateThenDoLogin(BuildContext context) {
    if (context.read<LoginCubit>().formKey.currentState?.validate() == true) {
      context.read<LoginCubit>().emitLoginState();
    }
  }
}
