import 'package:flutter/material.dart';
import 'package:flutter_mobile_challenge_pragma/app/core/consts/app_const_colors.dart';
import 'package:flutter_mobile_challenge_pragma/app/core/widget/app_const_text.dart';

class CharacteristicsLevelWidget extends StatelessWidget {
  const CharacteristicsLevelWidget({super.key, required this.label, required this.color, required this.level});
  final String label;
  final Color color;
  final int level;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Row(
        children: [
          SizedBox(width: 140, child: AppConstText.mediumText(text: label, fontWeight: FontWeight.w500)),
          Spacer(),
          Row(
            children: List.generate(5, (index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 2.0),
                child: Icon(Icons.circle, size: 16, color: index < level ? color : AppConstColors.grey300),
              );
            }),
          ),
        ],
      ),
    );
  }
}
