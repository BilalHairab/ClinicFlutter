import 'package:clinic_flutter/core/helpers/extensions.dart';
import 'package:clinic_flutter/features/home/data/models/specializations_response_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles.dart';

class SpecialityListViewItem extends StatelessWidget {
  final SpecializationsData? specializationsData;
  final int itemIndex;
  final int selectedIndex;

  const SpecialityListViewItem(
      {super.key, required this.specializationsData, required this.itemIndex, required this.selectedIndex});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(start: itemIndex == 0 ? 0 : 24.w),
      child: Column(
        children: [
          itemIndex == selectedIndex
              ? Container(
                  decoration: BoxDecoration(border: Border.all(color: ColorsManager.darkBlue), shape: BoxShape.circle),
                  child: CircleAvatar(
                    radius: 28.0.r,
                    backgroundColor: ColorsManager.lighterGray,
                    child: SvgPicture.asset(
                      'assets/svgs/doctor_general_speciality_icon.svg',
                      height: 42.h,
                      width: 42.w,
                    ),
                  ),
                )
              : CircleAvatar(
                  radius: 28.0.r,
                  backgroundColor: ColorsManager.lightBlue,
                  child: SvgPicture.asset(
                    'assets/svgs/doctor_general_speciality_icon.svg',
                    height: 40.h,
                    width: 40.w,
                  ),
                ),
          8.0.toVerticalSpacing(),
          Text(
            specializationsData?.name ?? "",
            style: itemIndex == selectedIndex ? TextStyles.font14DarkBlueBold : TextStyles.font12GrayRegular,
          )
        ],
      ),
    );
  }
}
