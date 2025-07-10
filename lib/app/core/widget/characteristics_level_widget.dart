import 'package:flutter/material.dart';

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
          SizedBox(width: 140, child: Text(label, style: const TextStyle(fontSize: 16))),
          Spacer(),
          Row(
            children: List.generate(5, (index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 2.0),
                child: Icon(Icons.circle, size: 16, color: index < level ? color : Colors.grey.shade300),
              );
            }),
          ),
        ],
      ),
    );
  }
}
