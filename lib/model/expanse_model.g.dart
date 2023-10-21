// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'expanse_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ExpanseModelAdapter extends TypeAdapter<ExpanseModel> {
  @override
  final int typeId = 1;

  @override
  ExpanseModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ExpanseModel(
      fields[1] as String,
      fields[2] as double,
      fields[3] as String,
      fields[4] as Category,
    );
  }

  @override
  void write(BinaryWriter writer, ExpanseModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.amount)
      ..writeByte(3)
      ..write(obj.date)
      ..writeByte(4)
      ..write(obj.category);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ExpanseModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class ExpanseListForEachCategoryAdapter
    extends TypeAdapter<ExpanseListForEachCategory> {
  @override
  final int typeId = 2;

  @override
  ExpanseListForEachCategory read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ExpanseListForEachCategory(
      fields[0] as Category,
      (fields[1] as List).cast<ExpanseModel>(),
    );
  }

  @override
  void write(BinaryWriter writer, ExpanseListForEachCategory obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.category)
      ..writeByte(1)
      ..write(obj.expanseList);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ExpanseListForEachCategoryAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class CategoryAdapter extends TypeAdapter<Category> {
  @override
  final int typeId = 0;

  @override
  Category read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 1:
        return Category.food;
      case 2:
        return Category.travel;
      case 3:
        return Category.shopping;
      case 4:
        return Category.other;
      default:
        return Category.food;
    }
  }

  @override
  void write(BinaryWriter writer, Category obj) {
    switch (obj) {
      case Category.food:
        writer.writeByte(1);
        break;
      case Category.travel:
        writer.writeByte(2);
        break;
      case Category.shopping:
        writer.writeByte(3);
        break;
      case Category.other:
        writer.writeByte(4);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CategoryAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
