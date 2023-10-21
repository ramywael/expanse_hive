import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubits/fetch_list_expanses_cubit.dart';
import 'expanse_list_view.dart';

class HomeBodyContent extends StatefulWidget {
  const HomeBodyContent({Key? key}) : super(key: key);

  @override
  State<HomeBodyContent> createState() => _HomeBodyContentState();
}

class _HomeBodyContentState extends State<HomeBodyContent> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<FetchListExpansesCubit>(context).fetchAllExpanses();
  }
  @override
  Widget build(BuildContext context) {
    return const ExpanseListView();
  }
}


