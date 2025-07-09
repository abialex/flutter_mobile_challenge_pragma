// ignore_for_file: lines_longer_than_80_chars

import 'package:flutter/material.dart';

class AppBasePage extends StatelessWidget {
  const AppBasePage({super.key, this.headerWidget, this.bodyWidget, this.footerWidget});
  final Widget? headerWidget;
  final Widget? bodyWidget;
  final Widget? footerWidget;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          SizedBox(height: 10),
          if (headerWidget == null) const SizedBox.shrink() else headerWidget!,
          if (bodyWidget == null)
            const SizedBox.shrink()
          else
            Expanded(child: Padding(padding: EdgeInsets.symmetric(horizontal: 24.0), child: bodyWidget!)),
          if (footerWidget == null) const SizedBox.shrink() else footerWidget!,
        ],
      ),
    );
  }
}
