import 'package:flutter/material.dart';
import 'package:flutter_mobile_challenge_pragma/app/core/widget/app_const_text.dart';

class AppDialogWidget extends StatelessWidget {
  final String title;
  final String message;
  final List<Widget>? actions;

  const AppDialogWidget({super.key, required this.title, required this.message, this.actions});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: AppConstText.largeText(text: title),
      content: AppConstText.mediumText(text: message),
      actions:
          actions ??
          [TextButton(onPressed: () => Navigator.of(context).pop(), child: AppConstText.mediumText(text: 'OK'))],
    );
  }
}
