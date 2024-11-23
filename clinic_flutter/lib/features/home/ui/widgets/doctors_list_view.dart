import 'package:clinic_flutter/features/home/data/models/specializations_response_model.dart';
import 'package:clinic_flutter/features/home/ui/widgets/doctors_list_view_item.dart';
import 'package:flutter/material.dart';

class DoctorsListView extends StatelessWidget {
  final List<Doctor?>? doctorsList;

  const DoctorsListView({super.key, this.doctorsList});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(itemCount: doctorsList?.length ?? 0, itemBuilder: (context, index) {
        return DoctorsListViewItem(doctor: doctorsList?[index],);
      }),
    );
  }
}
