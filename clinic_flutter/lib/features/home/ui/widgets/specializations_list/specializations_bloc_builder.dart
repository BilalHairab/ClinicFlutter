import 'package:clinic_flutter/core/helpers/extensions.dart';
import 'package:clinic_flutter/features/home/ui/widgets/specializations_list/speciality_shimmer_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/models/specializations_response_model.dart';
import '../../../logic/home_cubit.dart';
import '../../../logic/home_state.dart';
import '../doctors_list/doctors_shimmer_loading.dart';
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

  //This shimmer is for both Speciality and Doctors, try to think of a better way to handle states
  Widget setupLoading() {
    return Expanded(
      child: Column(
        children: [
          const SpecialityShimmerLoading(),
          8.0.toVerticalSpacing(),
          const DoctorsShimmerLoading(),
        ],
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
