import 'package:clinic_flutter/features/home/data/models/specializations_response_model.dart';
import 'package:clinic_flutter/features/home/ui/widgets/doctor_speciality_list_view_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DoctorsSpecialityListView extends StatelessWidget {
  final List<SpecializationsData?> specializationsList;

  const DoctorsSpecialityListView({super.key, required this.specializationsList});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: specializationsList.length,
        itemBuilder: (context, index) {
          return DoctorSpecialityListViewItem(
            specializationsData: specializationsList[index],
            itemIndex: index,
          );
        },
      ),
    );
  }
}
