import 'package:flutter_bloc/flutter_bloc.dart';

class KeyboardVisibilityCubit extends Cubit<bool> {
  KeyboardVisibilityCubit() : super(false);

  void setVisible(bool isVisible) => emit(isVisible);
}
