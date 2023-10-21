import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:uuid/uuid.dart';
part 'expanse_model.g.dart';

const Uuid _uuid = Uuid();

@HiveType(typeId: 0)
enum Category {
  @HiveField(1)
  food,
  @HiveField(2)
  travel,
  @HiveField(3)
  shopping,
  @HiveField(4)
  other,
}

const categoryIconData = {
  Category.food: Icons.fastfood,
  Category.travel: Icons.flight,
  Category.shopping: Icons.shopping_cart,
  Category.other: Icons.money,
};

@HiveType(typeId: 1)
class ExpanseModel extends HiveObject {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String title;
  @HiveField(2)
  final double amount;
  @HiveField(3)
  final String date;
  @HiveField(4)
  final Category category;

  ExpanseModel(
    this.title,
    this.amount,
    this.date,
    this.category,
  ) : id = _uuid
            .v4(); // after creatiing an  object of expanse it will generate a random id for it
}

@HiveType(typeId: 2)
class ExpanseListForEachCategory extends HiveObject {
  @HiveField(0)
  final Category category;
  @HiveField(1)
  final List<ExpanseModel> expanseList;

  ExpanseListForEachCategory(this.category, this.expanseList);
  ExpanseListForEachCategory.forCate(
      this.category, List<ExpanseModel> allExpanse)
      : expanseList = allExpanse
            .where((element) => element.category == category)
            .toList();
  @HiveField(2)
  double getTotalAmount()
  {
    double sum=0;
  for(var element in expanseList)
    {
      sum+=element.amount;
    }

    return sum;
  }

}
