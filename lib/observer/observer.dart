
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SimpleBlocObserver implements BlocObserver{
  @override
  void onChange(BlocBase bloc, Change change) {
    // TODO: implement onChange
    debugPrint("BlocObserver: $bloc, $change");
  }


  @override
  void onClose(BlocBase bloc) {
    // TODO: implement onClose
    debugPrint("BlocObserver: $bloc");

  }

  @override
  void onCreate(BlocBase bloc) {
    // TODO: implement onCreate
    debugPrint("BlocObserver: $bloc");
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    // TODO: implement onError
    debugPrint("BlocObserver: $bloc, $error, $stackTrace");
  }

  @override
  void onEvent(Bloc bloc, Object? event) {
    // TODO: implement onEvent
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    // TODO: implement onTransition
  }

}