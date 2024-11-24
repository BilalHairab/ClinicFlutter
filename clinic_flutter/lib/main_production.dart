import 'package:clinic_flutter/core/helpers/extensions.dart';
import 'package:clinic_flutter/core/routing/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/di/dependency_injection.dart';
import 'core/helpers/constants.dart';
import 'core/helpers/shared_pref_helper.dart';
import 'doc_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupGetIt();
  await ScreenUtil.ensureScreenSize();
  await checkIfLoggedInUser();
  runApp(DocApp(
    appRouter: AppRouter(),
  ));
}

checkIfLoggedInUser() async {
  String? userToken =
  await SharedPrefHelper.getSecuredString(SharedPrefKeys.userToken);
  if (userToken?.isNullOrEmpty() == true) {
    isLoggedInUser = false;
  } else {
    isLoggedInUser = true;
  }
}