import 'package:flutter/material.dart';
import 'package:flutter_mobile_challenge_pragma/app/core/consts/app_const_colors.dart';

class CardWidget extends StatelessWidget {
  const CardWidget({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 24, horizontal: 24),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(10)),
        color: AppConstColors.white,
      ),
      child: child,
    );
  }
}
