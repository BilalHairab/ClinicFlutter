import 'package:clinic_flutter/features/home/data/models/specializations_response_model.dart';
import 'package:clinic_flutter/features/home/logic/home_cubit.dart';
import 'package:clinic_flutter/features/home/ui/widgets/specializations_list/speciality_list_view_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SpecialityListView extends StatefulWidget {
  final List<SpecializationsData?> specializationsList;

  const SpecialityListView({super.key, required this.specializationsList});

  @override
  State<SpecialityListView> createState() => _SpecialityListViewState();
}

class _SpecialityListViewState extends State<SpecialityListView> {
  var selectedSpecialityIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: widget.specializationsList.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                selectedSpecialityIndex = index;
              });
              final newId = widget.specializationsList[index]?.id;
              if(newId != null) {
                context.read<HomeCubit>().getDoctorsList(specializationId: newId);
              }
            },
            child: SpecialityListViewItem(
              specializationsData: widget.specializationsList[index],
              itemIndex: index,
              selectedIndex: selectedSpecialityIndex,
            ),
          );
        },
      ),
    );
  }
}
