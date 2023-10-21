part of 'fetch_list_expanses_cubit.dart';

@immutable
abstract class FetchListExpansesState {}

class FetchListExpansesInitial extends FetchListExpansesState {}
class FetchListExpansesSuccess extends FetchListExpansesState {
  final List<ExpanseModel> expanseList;

  FetchListExpansesSuccess(this.expanseList);
}

