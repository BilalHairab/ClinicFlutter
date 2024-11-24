import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../data/models/specializations_response_model.dart';
import '../../logic/home_cubit.dart';
import '../../logic/home_state.dart';
import 'speciality_list_view.dart';

class SpecializationsBlocBuilder extends StatelessWidget {
  const SpecializationsBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return state.maybeWhen(specializationsLoading: () {
          return setupLoading();
        }, specializationsSuccess: (specializationDataList) {
          return setupSuccess(specializationDataList);
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
    return SpecialityListView(
      specializationsList: specializationsList ?? [],
    );
  }

  Widget setupError() {
    return const SizedBox.shrink();
  }
}
