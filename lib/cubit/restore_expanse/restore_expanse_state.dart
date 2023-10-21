part of 'restore_expanse_cubit.dart';

@immutable
abstract class RestoreExpanseState {}

class RestoreExpanseInitial extends RestoreExpanseState {}
class RestoreExpanseSuccess extends RestoreExpanseState {}
class RestoreExpanseLoading extends RestoreExpanseState {}
class RestoreExpanseFailure extends RestoreExpanseState {
 final  String errMessage;
  RestoreExpanseFailure(this.errMessage);
}
