import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../model/expanse_model.dart';

part 'display_fractionally_container_state.dart';

class DisplayFractionallyContainerCubit extends Cubit<DisplayFractionallyContainerState> {
  DisplayFractionallyContainerCubit() : super(DisplayFractionallyContainerInitial());

}
