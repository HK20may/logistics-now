import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logistics_now/data/location_value.dart';
import 'package:logistics_now/domain/services/location_search_service.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  LocationValue locationValue = LocationValue();

  Future<void> searchingLocationData(String searchedText) async {
    emit(HomeLoading());
    if (searchedText.length > 2) {
      try {
        locationValue =
            await LocationSearchService().fetchLocationData(searchedText);
      } catch (e) {
        FocusManager.instance.primaryFocus?.unfocus();
        log("Something went wrong");
      }
    }
    emit(HomeData(id: DateTime.now()));
  }
}
