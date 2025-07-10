import 'package:flutter_bloc/flutter_bloc.dart';

class CanPopCubit extends Cubit<bool> {
  CanPopCubit() : super(false);
  void set(bool value) => emit(value);
}
