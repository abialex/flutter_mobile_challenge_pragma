import 'package:flutter/material.dart';
import 'package:flutter_mobile_challenge_pragma/app/config/widget/keyboard_visibility_listener/keyboard_visibility_cubit.dart';
import 'package:flutter_mobile_challenge_pragma/app/main.dart';

class AppKeyboardVisibilityListener extends StatefulWidget {
  const AppKeyboardVisibilityListener({required this.child, super.key});

  final Widget child;

  @override
  State<AppKeyboardVisibilityListener> createState() => _AppKeyboardVisibilityListenerState();
}

class _AppKeyboardVisibilityListenerState extends State<AppKeyboardVisibilityListener> with WidgetsBindingObserver {
  late final KeyboardVisibilityCubit _keyboardCubit;

  @override
  void initState() {
    super.initState();
    _keyboardCubit = getItApp.get<KeyboardVisibilityCubit>();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeMetrics() {
    final bottomInset = MediaQuery.of(context).viewInsets.bottom;
    final isVisible = bottomInset > 0;
    _keyboardCubit.setVisible(isVisible);
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
