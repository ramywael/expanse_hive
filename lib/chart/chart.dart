import 'package:expanse_hive/cubits/fetch_list_expanses_cubit.dart';
import 'package:expanse_hive/model/expanse_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'chart_bar.dart';

class Chart extends StatelessWidget {
  final List<ExpanseModel> expanseList;
  List<ExpanseListForEachCategory> get buckets {
    return [
      ExpanseListForEachCategory.forCate(Category.food, expanseList),
      ExpanseListForEachCategory.forCate(Category.other, expanseList),
      ExpanseListForEachCategory.forCate(Category.travel, expanseList),
      ExpanseListForEachCategory.forCate(Category.shopping, expanseList),
    ];
  }
  double  get maxTotalAmount {
    double max=0;
    for(var bucket in buckets){
      if(bucket.getTotalAmount() > max)
      {
        max=bucket.getTotalAmount();
      }
    }
    return max;
  }
  const Chart({Key? key, required this.expanseList}) : super(key: key);
  //if we are gone talk about the charts so we should determine that we need that for each category it will represents its category
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) => Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Theme.of(context).colorScheme.primary.withOpacity(0.3),
              Theme.of(context).colorScheme.secondary.withOpacity(0.1),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        width: double.infinity,
        height: constraints.maxHeight,
          // it isnot sufficent to  make the height of the container is fixed
        // so we will use the LayoutBuilder to get the max height of the container
        // and we will use it in the height of the container
        child: Column(
          children: [
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  for (var element in buckets)
                    ChartBar(
                      fill: element.getTotalAmount() == 0
                          ? 0
                          : element.getTotalAmount() /
                          maxTotalAmount,
                    )
                ],
              ),
            ),
            Row(
              children: buckets
                  .map(
                    (e) => Expanded(
                  child: Icon(
                    categoryIconData[e.category],
                  ),
                ),
              )
                  .toList(),
            )
          ],
        )
        ),
      );
  }
}
