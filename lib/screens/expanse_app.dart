import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubits/fetch_list_expanses_cubit.dart';
import 'home_screen.dart';

var kcolorScheme =
    ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 59, 96, 179));

class ExpanseApp extends StatelessWidget {
  const ExpanseApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) {
        return FetchListExpansesCubit();
      },
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            useMaterial3: true,
            appBarTheme: const AppBarTheme().copyWith(
              color: kcolorScheme.onSecondaryContainer,
              foregroundColor: kcolorScheme.onPrimary,
            ),
            textTheme: const TextTheme().copyWith(
                titleLarge: const TextStyle(
              fontSize: 20,
            ),),),
        home: const HomeScreen(),
      ),
    );
  }
}
