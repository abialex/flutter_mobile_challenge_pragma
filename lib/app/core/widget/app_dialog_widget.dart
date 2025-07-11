import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_mobile_challenge_pragma/app/config/widget/http_error_listener/http_error_bloc/http_error_bloc.dart';
import 'package:flutter_mobile_challenge_pragma/app/config/widget/http_error_listener/http_error_bloc/http_error_event.dart';
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
          [
            TextButton(
              onPressed: () {
                context.read<HttpErrorBloc>().add(HttpErrorEvent.initial());
                Navigator.of(context).pop();
              },
              child: AppConstText.mediumText(text: 'OK'),
            ),
          ],
    );
  }
}
