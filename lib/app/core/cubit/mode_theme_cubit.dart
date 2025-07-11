import 'package:flutter_bloc/flutter_bloc.dart';

class ModeThemeCubit extends Cubit<bool> {
  //true light
  //false night
  ModeThemeCubit() : super(false);

  void lightMode() => emit(true);
  void darjMode() => emit(false);
  void toggle() => emit(!state);
}
