part of 'add_expanse_cubit.dart';

@immutable
abstract class AddExpanseState {}

class AddExpanseInitial extends AddExpanseState {}
class AddExpanseLoading extends AddExpanseState {}
class AddExpanseFailure extends AddExpanseState {
  final String errMessage;
  AddExpanseFailure(this.errMessage);
}
class AddExpanseSuccess extends AddExpanseState {}

