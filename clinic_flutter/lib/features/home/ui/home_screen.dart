import 'package:clinic_flutter/core/helpers/extensions.dart';
import 'package:clinic_flutter/features/home/ui/widgets/doctors_blue_container.dart';
import 'package:clinic_flutter/features/home/ui/widgets/doctors_list_view.dart';
import 'package:clinic_flutter/features/home/ui/widgets/doctors_speciality_list_view.dart';
import 'package:clinic_flutter/features/home/ui/widgets/doctors_speciality_see_all.dart';
import 'package:clinic_flutter/features/home/ui/widgets/home_top_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          margin: EdgeInsets.fromLTRB(20.0.w, 16.0.h, 20.0.w, 28.0.h),
          child: Column(
            children: [
              const HomeTopBar(),
              const DoctorsBlueContainer(),
              14.0.toVerticalSpacing(),
              const DoctorsSpecialitySeeAll(),
              8.0.h.toVerticalSpacing(),
              const DoctorsSpecialityListView(),
              const DoctorsListView(),
            ],
          ),
        ),
      ),
    );
  }
}
