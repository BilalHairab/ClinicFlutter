import 'package:clinic_flutter/core/helpers/extensions.dart';
import 'package:clinic_flutter/core/theming/colors.dart';
import 'package:flutter/material.dart';

import '../../../../core/theming/styles.dart';

class PasswordValidations extends StatelessWidget {
  final bool hasLowerCase;
  final bool hasUpperCase;
  final bool hasSpecialCharacters;
  final bool hasNumber;
  final bool hasMinimumLength;

  const PasswordValidations(
      {super.key,
      required this.hasLowerCase,
      required this.hasUpperCase,
      required this.hasSpecialCharacters,
      required this.hasNumber,
      required this.hasMinimumLength});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildValidationRow('At Least 1 lowercase letter', hasLowerCase),
        2.0.toVerticalSpacing(),
        buildValidationRow('At Least 1 uppercase letter', hasUpperCase),
        2.0.toVerticalSpacing(),
        buildValidationRow('At Least 1 special character', hasSpecialCharacters),
        2.0.toVerticalSpacing(),
        buildValidationRow('At Least 1 number', hasNumber),
        2.0.toVerticalSpacing(),
        buildValidationRow('At Least 8 characters long', hasMinimumLength),
        2.0.toVerticalSpacing(),
      ],
    );
  }

  buildValidationRow(String text, bool valid) {
    return Row(
      children: [
        const CircleAvatar(
          radius: 2.5,
          backgroundColor: ColorsManager.gray,
        ),
        6.0.toHorizontalSpacing(),
        Text(
          text,
          style: TextStyles.font13DarkBlueRegular.copyWith(
            decoration: valid ? TextDecoration.lineThrough : null,
            decorationColor: valid ? Colors.green : Colors.red,
            decorationThickness: 2,
            color: valid ? ColorsManager.gray : ColorsManager.darkBlue,
          ),
        )
      ],
    );
  }
}
