// ignore_for_file: lines_longer_than_80_chars

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_mobile_challenge_pragma/app/core/consts/app_const_image.dart';
import 'package:flutter_mobile_challenge_pragma/app/core/cubit/can_pop_cubit.dart';
import 'package:flutter_mobile_challenge_pragma/app/core/widget/app_box.dart';
import 'package:flutter_mobile_challenge_pragma/app/core/widget/app_header_page.dart';
import 'package:go_router/go_router.dart';

class AppBasePage extends StatelessWidget {
  const AppBasePage({super.key, this.title, this.headerWidget, this.bodyWidget, this.footerWidget, this.paddingBody});
  final Widget? headerWidget;
  final Widget? bodyWidget;
  final Widget? footerWidget;
  final String? title;
  final EdgeInsets? paddingBody;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage(AppConstImage.background_body), fit: BoxFit.cover),
      ),
      child: Scaffold(
        floatingActionButton:
            context.watch<CanPopCubit>().state
                ? FloatingActionButton(
                  onPressed: () {
                    context.pop(context);
                  },
                  child: Icon(Icons.arrow_back),
                )
                : null,
        backgroundColor: Colors.transparent,
        body: Column(
          children: [
            if (title != null && title!.isNotEmpty)
              Padding(padding: const EdgeInsets.symmetric(horizontal: 24), child: AppHeaderPage(title: title!))
            else
              const SizedBox.shrink(),
            AppBox.h24,
            if (headerWidget == null) const SizedBox.shrink() else headerWidget!,
            if (bodyWidget == null)
              const SizedBox.shrink()
            else
              Expanded(
                child: Padding(padding: paddingBody ?? EdgeInsets.symmetric(horizontal: 24.0), child: bodyWidget!),
              ),
            if (footerWidget == null) const SizedBox.shrink() else footerWidget!,
          ],
        ),
      ),
    );
  }
}
