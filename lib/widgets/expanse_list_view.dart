import 'package:expanse_hive/chart/chart.dart';
import 'package:expanse_hive/constants/constants.dart';
import 'package:expanse_hive/cubit/addexpansecubit/add_expanse_cubit.dart';
import 'package:expanse_hive/cubit/restore_expanse/restore_expanse_cubit.dart';
import 'package:expanse_hive/model/expanse_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../cubits/fetch_list_expanses_cubit.dart';
import 'expanse_item.dart';

class ExpanseListView extends StatefulWidget {
  const ExpanseListView({
    super.key,
  });

  @override
  State<ExpanseListView> createState() => _ExpanseListViewState();
}

class _ExpanseListViewState extends State<ExpanseListView> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FetchListExpansesCubit, FetchListExpansesState>(
      builder: (context, state) {
        List<ExpanseModel> expanseList = BlocProvider.of<FetchListExpansesCubit>(context).expanseList;
        if (state is FetchListExpansesSuccess) {
          return Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              children: [
                 Expanded(
                  child: Chart(expanseList: state.expanseList),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: expanseList.length,
                    itemBuilder: (context, index) {
                      return Dismissible(
                        background: Container(
                          margin: EdgeInsets.symmetric(
                            vertical: MediaQuery.of(context).size.width / 400,
                          ),
                          color: Colors.red,
                          child: const Icon(Icons.delete),
                        ),
                        onDismissed: (direction) {
                          expanseList[index].delete();
                          BlocProvider.of<FetchListExpansesCubit>(context).fetchAllExpanses();
                          ScaffoldMessenger.of(context).clearSnackBars();
                          scaffoldMassengar(context, expanseList,
                              expanseList[index]);
                        },
                        key: UniqueKey(), // the property keys is used to determine the item that wants to be deleted
                        child: ExpanseItem(
                          expanse: expanseList[index],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        } else {
          return const Center(
              child: Text(
            "No Expanses Yet",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ));
        }
      },
    );
  }

  void scaffoldMassengar(BuildContext context, List<ExpanseModel> expanseList,
      ExpanseModel expanse) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 10),
        action: SnackBarAction(
          label: "Undo",
          onPressed: () async {
            final currentIndex = expanseList.indexOf(
                expanse); // when i click on undo it determine the index of the item that i want to undo
            final expanseBox = Hive.box<ExpanseModel>(kBoxName);
            await expanseBox.put(currentIndex, expanse);
            BlocProvider.of<FetchListExpansesCubit>(context).fetchAllExpanses();
          },
        ),
        content: const Text(
          "Item Deleted",
        ),
      ),
    );
  }
}
