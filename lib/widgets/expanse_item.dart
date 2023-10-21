import 'package:expanse_hive/model/expanse_model.dart';
import 'package:flutter/material.dart';

class ExpanseItem extends StatelessWidget {
  final ExpanseModel expanse;
  const ExpanseItem({
    super.key, required this.expanse,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).colorScheme.secondaryContainer,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            8,
          )),
      child:  Padding(
        padding: const  EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(expanse.title),
            Row(
              children: [
                Text("\$${expanse.amount.toString()}"),
                const Spacer(),
                Row(
                  children: [
                    Icon(categoryIconData[expanse.category]),
                    Text(expanse.date),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
