import 'package:clinic_flutter/core/helpers/extensions.dart';
import 'package:clinic_flutter/core/networking/api_error_handler.dart';
import 'package:clinic_flutter/features/home/data/models/specializations_response_model.dart';
import 'package:clinic_flutter/features/home/data/repos/home_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepo _homeRepo;

  HomeCubit(this._homeRepo) : super(const HomeState.initial());

  List<SpecializationsData?> specializationsList = [];

  void getSpecializations() async {
    emit(const HomeState.specializationsLoading());
    final response = await _homeRepo.getSpecializations();
    response.when(success: (specializationsResponseModel) {
      specializationsList = specializationsResponseModel.specializationDataList ?? [];
      var firstId = specializationsList.first?.id;
      if (firstId != null) {
        getDoctorsList(specializationId: firstId);
      }
      emit(HomeState.specializationsSuccess(specializationsList));
    }, failure: (errorHandler) {
      emit(HomeState.error(errorHandler));
    });
  }

  void getDoctorsList({required int specializationId}) {
    List<Doctor?> specializationDoctorsList = getDoctorsListBySpecializationId(specializationId);
    if (specializationDoctorsList.isNullOrEmpty()) {
      emit(HomeState.doctorsError(ErrorHandler.handle('No Doctors Found')));
    } else {
      emit(HomeState.doctorsSuccess(specializationDoctorsList));
    }
  }

  List<Doctor?> getDoctorsListBySpecializationId(int specializationId) {
    return specializationsList.firstWhere((specialization) {
          return specialization?.id == specializationId;
        })?.doctorsList ??
        [];
  }
}
