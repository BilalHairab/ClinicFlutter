import 'package:clinic_flutter/core/helpers/extensions.dart';
import 'package:clinic_flutter/features/home/data/models/specializations_response_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/theming/styles.dart';


class DoctorsListViewItem extends StatelessWidget {
  final Doctor? doctor;
  const DoctorsListViewItem({super.key, this.doctor});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16.h),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12.r),
            child: Image.network(
                width: 110.w,
                height: 120.h,
                fit: BoxFit.cover,
                "https://static.wikia.nocookie.net/five-world-war/images/6/64/Hisoka.jpg/revision/latest?cb=20190313114050"),
          ),
          16.0.toHorizontalSpacing(),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  doctor?.name ?? "",
                  style: TextStyles.font18DarkBlueBold,
                  overflow: TextOverflow.ellipsis,
                ),
                5.0.toVerticalSpacing(),
                Text(
                  "${doctor?.degree} | ${doctor?.phone}",
                  style: TextStyles.font12GrayMedium,
                ),
                5.0.toVerticalSpacing(),
                Text(
                  doctor?.email ?? "Email",
                  style: TextStyles.font12GrayMedium,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
