import 'package:bloc/bloc.dart';
import 'package:expanse_hive/constants/constants.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:meta/meta.dart';

import '../model/expanse_model.dart';

part 'fetch_list_expanses_state.dart';

class FetchListExpansesCubit extends Cubit<FetchListExpansesState> {
  FetchListExpansesCubit() : super(FetchListExpansesInitial());

// we should make the trigger to fetch the data from the database
  List<ExpanseModel> expanseList = [];

  fetchAllExpanses() {
    // here we should fetch the data from the database
    // and then emit the state
    var expanseBox = Hive.box<ExpanseModel>(kBoxName);
    expanseList = expanseBox.values.toList();
    if (expanseList.isNotEmpty) {
      emit(FetchListExpansesSuccess(expanseList));
    } else {
      emit(FetchListExpansesInitial());
    }
  }
}
