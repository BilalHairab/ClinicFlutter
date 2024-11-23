import 'package:clinic_flutter/core/helpers/extensions.dart';
import 'package:clinic_flutter/features/home/data/models/specializations_response_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles.dart';

class DoctorSpecialityListViewItem extends StatelessWidget {
  final SpecializationsData? specializationsData;
  final int itemIndex;
  const DoctorSpecialityListViewItem({super.key, required this.specializationsData, required this.itemIndex});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(start: itemIndex == 0 ? 0 : 24.w),
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
            specializationsData?.name ?? "",
            style: TextStyles.font12GrayRegular,
          )
        ],
      ),
    );
  }
}
