import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:expanse_hive/model/expanse_model.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:meta/meta.dart';

import '../../constants/constants.dart';

part 'restore_expanse_state.dart';

class RestoreExpanseCubit extends Cubit<RestoreExpanseState> {
  RestoreExpanseCubit() : super(RestoreExpanseInitial());

  restoreExpanse(int index, ExpanseModel expanse) async {
    emit(RestoreExpanseLoading());
    try {
      var expanseBox = Hive.box<ExpanseModel>(kBoxName);
      await expanseBox.put(index, expanse);
      emit(RestoreExpanseSuccess());
    } catch (e) {
      emit(RestoreExpanseFailure(e.toString()));
      log(e.toString());
    }
  }
}
