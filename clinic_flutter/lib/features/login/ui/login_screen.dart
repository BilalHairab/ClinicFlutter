import 'package:clinic_flutter/core/helpers/extensions.dart';
import 'package:clinic_flutter/core/theming/styles.dart';
import 'package:clinic_flutter/core/widgets/app_text_button.dart';
import 'package:clinic_flutter/core/widgets/app_text_form_field.dart';
import 'package:clinic_flutter/features/login/ui/widgets/dont_have_account_text.dart';
import 'package:clinic_flutter/features/login/ui/widgets/terms_and_conditions_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();
  bool isObscureText = true;

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
                Form(
                    key: formKey,
                    child: Column(
                      children: [
                        AppTextFormField(hintText: "Email", validator: (String? x) {}),
                        18.0.toVerticalSpacing(),
                        AppTextFormField(
                            hintText: "Password",
                            isObscureText: isObscureText,
                            suffixIcon: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    isObscureText = !isObscureText;
                                  });
                                },
                                child: Icon(isObscureText ? Icons.visibility_off : Icons.visibility)),
                            validator: (String? x) {}),
                        24.0.toVerticalSpacing(),
                        //Use Align if we want to disagree with the parent widget's align
                        Align(
                          child: Text(
                            "Forgot Password?",
                            style: TextStyles.font13BlueRegular,
                          ),
                          //Use AlignmentDirectional if we want to respect RTL
                          alignment: AlignmentDirectional.centerEnd,
                        ),
                        40.0.toVerticalSpacing(),
                        AppTextButton(
                          buttonText: "Login",
                          textStyle: TextStyles.font16WhiteSemiBold,
                          onPressed: () {},
                        ),
                        16.0.toVerticalSpacing(),
                        TermsAndConditionsText(),
                        60.0.toVerticalSpacing(),
                        DontHaveAccountText(),
                      ],
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
