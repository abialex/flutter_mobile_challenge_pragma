import 'package:flutter/material.dart';
import 'package:flutter_mobile_challenge_pragma/app/config/widget/lifecycle_listener/app_lifecycle_cubit.dart';
import 'package:flutter_mobile_challenge_pragma/app/main.dart';

class AppLifecycleHandler extends StatefulWidget {
  const AppLifecycleHandler({required this.child, super.key});

  final Widget child;

  @override
  State<AppLifecycleHandler> createState() => _AppLifecycleHandlerState();
}

class _AppLifecycleHandlerState extends State<AppLifecycleHandler> with WidgetsBindingObserver {
  late final AppLifecycleCubit _appLifecycleCubit;

  @override
  void initState() {
    super.initState();
    _appLifecycleCubit = getItApp.get<AppLifecycleCubit>();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);

    switch (state) {
      case AppLifecycleState.paused:
        _appLifecycleCubit.setLifecycleState(AppLifecycleStatus.paused);
        break;
      case AppLifecycleState.resumed:
        _appLifecycleCubit.setLifecycleState(AppLifecycleStatus.resumed);
        break;
      case AppLifecycleState.inactive:
        _appLifecycleCubit.setLifecycleState(AppLifecycleStatus.inactive);
        break;
      case AppLifecycleState.detached:
        _appLifecycleCubit.setLifecycleState(AppLifecycleStatus.detached);
        break;
      case AppLifecycleState.hidden:
        _appLifecycleCubit.setLifecycleState(AppLifecycleStatus.hidden);
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
