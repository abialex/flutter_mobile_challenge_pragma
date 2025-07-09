import 'package:flutter_bloc/flutter_bloc.dart';

enum AppLifecycleStatus { resumed, paused, inactive, detached, hidden }

class AppLifecycleCubit extends Cubit<AppLifecycleStatus> {
  AppLifecycleCubit() : super(AppLifecycleStatus.resumed);

  void setLifecycleState(AppLifecycleStatus state) {
    emit(state);
  }
}
