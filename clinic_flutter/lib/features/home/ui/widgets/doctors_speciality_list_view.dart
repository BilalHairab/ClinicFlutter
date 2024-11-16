import 'package:clinic_flutter/core/helpers/extensions.dart';
import 'package:clinic_flutter/core/theming/colors.dart';
import 'package:clinic_flutter/core/theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class DoctorsSpecialityListView extends StatelessWidget {
  const DoctorsSpecialityListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 8,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsetsDirectional.only(start: index == 0 ? 0 : 24.w),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 28.0.r,
                  backgroundColor: ColorsManager.lighterGray,
                  child: SvgPicture.asset(
                    'assets/svgs/doctor_general_speciality_icon.svg',
                    height: 40.h,
                    width: 40.w,
                  ),
                ),
                8.0.h.toVerticalSpacing(),
                Text(
                  'Specialization',
                  style: TextStyles.font12GrayRegular,
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
