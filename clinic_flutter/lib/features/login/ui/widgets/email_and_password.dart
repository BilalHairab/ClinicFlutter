import 'package:clinic_flutter/core/helpers/app_regex.dart';
import 'package:clinic_flutter/core/helpers/extensions.dart';
import 'package:clinic_flutter/features/login/logic/login_cubit.dart';
import 'package:clinic_flutter/features/login/ui/widgets/password_valdiations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/widgets/app_text_form_field.dart';

class EmailAndPassword extends StatefulWidget {
  const EmailAndPassword({super.key});

  @override
  State<EmailAndPassword> createState() => _EmailAndPasswordState();
}

class _EmailAndPasswordState extends State<EmailAndPassword> {
  bool isObscureText = true;
  late TextEditingController passwordController;
  bool hasLowerCase = false;
  bool hasUpperCase = false;
  bool hasSpecialCharacters = false;
  bool hasNumber = false;
  bool hasMinimumLength = false;

  @override
  void initState() {
    super.initState();
    passwordController = context.read<LoginCubit>().passwordController;
    setupPasswordControllerListener();
  }

  void setupPasswordControllerListener() {
    passwordController.addListener(() {
      setState(() {
        hasLowerCase = AppRegex.hasLowerCase(passwordController.text);
        hasUpperCase = AppRegex.hasUpperCase(passwordController.text);
        hasSpecialCharacters = AppRegex.hasSpecialCharacter(passwordController.text);
        hasNumber = AppRegex.hasNumber(passwordController.text);
        hasMinimumLength = AppRegex.hasMinLength(passwordController.text);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: context.read<LoginCubit>().formKey,
        child: Column(
          children: [
            AppTextFormField(
              hintText: "Email",
              validator: (String? value) {
                if (value == null || value.isEmpty || !AppRegex.isEmailValid(value)) {
                  return 'Please enter a valid email';
                }
              },
              controller: context.read<LoginCubit>().emailController,
            ),
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
              controller: context.read<LoginCubit>().passwordController,
              validator: (String? value) {
                if (value == null || value.isEmpty || !AppRegex.isPasswordValid(value)) {
                  return 'Please enter a valid password';
                }
              },
            ),
            24.0.toVerticalSpacing(),
            PasswordValidations(
              hasLowerCase: hasLowerCase,
              hasUpperCase: hasUpperCase,
              hasSpecialCharacters: hasSpecialCharacters,
              hasNumber: hasNumber,
              hasMinimumLength: hasMinimumLength,
            ),
          ],
        ));
  }
  @override
  void dispose() {
    passwordController.dispose();
    super.dispose();
  }
}
