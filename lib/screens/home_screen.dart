import 'package:expanse_hive/cubit/addexpansecubit/add_expanse_cubit.dart';
import 'package:expanse_hive/cubit/restore_expanse/restore_expanse_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import '../widgets/add_expanse_form_app_bar.dart';
import '../widgets/home_body_content.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Expanse App"),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                showModalBottomSheet(
                  enableDrag: true,
                  isScrollControlled: true,
                  useSafeArea: true,
                  backgroundColor:
                      Theme.of(context).colorScheme.secondaryContainer,
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  )),
                  showDragHandle: true,
                  context: context,
                  builder: (context) {
                    return BlocProvider
                      (create: (BuildContext context) {
                        return AddExpanseCubit();
                    },
                      child: const AddExpanseForm());
                  },
                );
              },
              icon: const Icon(Icons.add))
        ],
      ),
      body: const HomeBodyContent(),
    );
  }
}
