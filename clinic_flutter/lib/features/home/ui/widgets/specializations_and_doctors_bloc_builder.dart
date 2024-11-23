import 'package:clinic_flutter/core/helpers/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../data/models/specializations_response_model.dart';
import '../../logic/home_cubit.dart';
import '../../logic/home_state.dart';
import 'doctors_list_view.dart';
import 'doctors_speciality_list_view.dart';

class SpecializationsAndDoctorsBlocBuilder extends StatelessWidget {
  const SpecializationsAndDoctorsBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return state.maybeWhen(specializationsLoading: () {
          return setupLoading();
        }, specializationsSuccess: (specializationResponseModel) {
          var specializationsList = specializationResponseModel.specializationDataList;
          return setupSuccess(specializationsList);
        }, error: (errorHandler) {
          return setupError();
        }, orElse: () {
          return setupError();
        });
      },
      buildWhen: (previous, current) =>
          current is SpecializationsLoading || current is SpecializationsSuccess || current is SpecializationsError,
    );
  }

  Widget setupLoading() {
    return SizedBox(
      height: 100.h,
      child: const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  Widget setupSuccess(List<SpecializationsData?>? specializationsList) {
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
  }

  Widget setupError() {
    return const SizedBox.shrink();
  }
}
