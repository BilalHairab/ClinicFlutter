import 'package:clinic_flutter/core/helpers/extensions.dart';
import 'package:clinic_flutter/features/home/logic/home_cubit.dart';
import 'package:clinic_flutter/features/home/logic/home_state.dart';
import 'package:clinic_flutter/features/home/ui/widgets/doctors_blue_container.dart';
import 'package:clinic_flutter/features/home/ui/widgets/doctors_list_view.dart';
import 'package:clinic_flutter/features/home/ui/widgets/doctors_speciality_list_view.dart';
import 'package:clinic_flutter/features/home/ui/widgets/doctors_speciality_see_all.dart';
import 'package:clinic_flutter/features/home/ui/widgets/home_top_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
              24.0.toVerticalSpacing(),
              const DoctorsSpecialitySeeAll(),
              18.0.h.toVerticalSpacing(),
              BlocBuilder<HomeCubit, HomeState>(
                builder: (context, state) {
                  return state.maybeWhen(specializationsLoading: () {
                    return SizedBox(
                      height: 100.h,
                      child: const Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  }, specializationsSuccess: (specializationResponseModel) {
                    var specializationsList = specializationResponseModel.specializationDataList;
                    return Expanded(
                      child: Column(
                        children: [
                          DoctorsSpecialityListView(
                            specializationsList: specializationsList ?? [],
                          ),
                          8.0.h.toVerticalSpacing(),
                          DoctorsListView(
                            doctorsList: specializationsList?[0]?.doctorsList,
                          ),
                        ],
                      ),
                    );
                  }, error: (errorHandler) {
                    return const SizedBox.shrink();
                  }, orElse: () {
                    return const SizedBox.shrink();
                  });
                },
                buildWhen: (previous, current) =>
                    current is SpecializationsLoading || current is SpecializationsSuccess || current is SpecializationsError,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
