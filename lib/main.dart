import 'package:expanse_hive/constants/constants.dart';
import 'package:expanse_hive/cubit/restore_expanse/restore_expanse_cubit.dart';
import 'package:expanse_hive/screens/expanse_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'model/expanse_model.dart';
import 'observer/observer.dart';

Future<void> main() async {
  Bloc.observer = SimpleBlocObserver(); // we use this to debug the app
  await Hive.initFlutter();
  Hive.registerAdapter(CategoryAdapter());
  Hive.registerAdapter(ExpanseListForEachCategoryAdapter());
  //Note we import that library that use hive_flutter
  Hive.registerAdapter(ExpanseModelAdapter()); // we need to register the adapter to use it as we operate with object
  await Hive.openBox<ExpanseModel>(kBoxName); // First we need to open a box to store its data inside it
  runApp(const ExpanseApp());
}
