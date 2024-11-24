import 'package:clinic_flutter/core/helpers/constants.dart';
import 'package:clinic_flutter/core/routing/app_router.dart';
import 'package:clinic_flutter/core/routing/routes.dart';
import 'package:clinic_flutter/core/theming/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DocApp extends StatelessWidget {
  final AppRouter appRouter;

  const DocApp({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        child: MaterialApp(
          title: "Doc App",
          theme: ThemeData(primaryColor: ColorsManager.mainBlue, scaffoldBackgroundColor: Colors.white),
          debugShowCheckedModeBanner: false,
          initialRoute: isLoggedInUser ? Routes.homeScreen : Routes.loginScreen,
          onGenerateRoute: appRouter.generateRoute,
        ));
  }
}
