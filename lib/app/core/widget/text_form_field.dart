import 'package:flutter/material.dart';
import 'package:flutter_mobile_challenge_pragma/app/core/consts/app_const_colors.dart';
import 'package:flutter_mobile_challenge_pragma/app/core/widget/app_const_text.dart';

class TextFormSearchField extends StatelessWidget {
  final String hintText;
  final TextEditingController? controller;
  final Function(String)? onFieldSubmitted;

  const TextFormSearchField({super.key, this.hintText = 'Search', this.controller, this.onFieldSubmitted});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppConstColors.white.withAlpha(240),
        borderRadius: BorderRadius.circular(15),
        boxShadow: [BoxShadow(color: AppConstColors.black12, blurRadius: 8, offset: Offset(2, 2))],
      ),
      child: TextFormField(
        onFieldSubmitted: (value) {
          onFieldSubmitted?.call(value);
        },
        controller: controller,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: AppConstText.smallText(text: '', color: AppConstColors.purple300).style,
          prefixIcon: Icon(Icons.search, color: AppConstColors.purple300),
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(vertical: 16, horizontal: 12),
        ),
        style: AppConstText.mediumText(text: '', color: AppConstColors.black87).style,
      ),
    );
  }
}
