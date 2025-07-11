import 'package:flutter/material.dart';

class TextFormSearchField extends StatelessWidget {
  final String hintText;
  final TextEditingController? controller;
  final Function(String)? onFieldSubmitted;
  final Color? searchIconColor;

  const TextFormSearchField({
    super.key,
    this.hintText = 'Search',
    this.controller,
    this.onFieldSubmitted,
    this.searchIconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface.withAlpha(240),
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).shadowColor.withAlpha((0.2 * 255).round()),
            blurRadius: 8,
            offset: const Offset(2, 2),
          ),
        ],
      ),
      child: TextFormField(
        onFieldSubmitted: (value) {
          onFieldSubmitted?.call(value);
        },
        controller: controller,
        decoration: InputDecoration(hintText: hintText, prefixIcon: Icon(Icons.search)),
      ),
    );
  }
}
