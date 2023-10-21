import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final double fill;
  const ChartBar({Key? key, required this.fill}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Expanded(
      child:  Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18,),
        child: FractionallySizedBox(
          heightFactor: fill,
          child: const DecoratedBox(
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(8),
                topLeft: Radius.circular(8),
              )
            ),
          ),
        ),
      ),
    );
  }
}
