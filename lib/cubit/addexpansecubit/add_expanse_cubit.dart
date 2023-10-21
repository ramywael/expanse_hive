import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:expanse_hive/constants/constants.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:meta/meta.dart';

import '../../model/expanse_model.dart';

part 'add_expanse_state.dart';

class AddExpanseCubit extends Cubit<AddExpanseState> {
  AddExpanseCubit() : super(AddExpanseInitial());
  //first in cubit we should do the trigger
  List<ExpanseModel> expanseList=[];
  addExpanse(ExpanseModel expanse)
  async {
    emit(AddExpanseLoading());
    try{
     var expanseBox= Hive.box<ExpanseModel>(kBoxName);
     await expanseBox.add(expanse);
     emit(AddExpanseSuccess());
    }catch (e)
    {
      emit(AddExpanseFailure(e.toString()));
      log(e.toString());
    }
  }
}
