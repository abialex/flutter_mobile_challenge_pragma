import 'package:flutter/material.dart';

class TextFormSearchField extends StatelessWidget {
  final String hintText;
  final TextEditingController? controller;
  final Function(String)? onFieldSubmitted;

  const TextFormSearchField({super.key, this.hintText = 'Search', this.controller, this.onFieldSubmitted});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withAlpha(240),
        borderRadius: BorderRadius.circular(15),
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 8, offset: Offset(2, 2))],
      ),
      child: TextFormField(
        onFieldSubmitted: (value) {
          onFieldSubmitted?.call(value);
        },
        controller: controller,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.purple[300]),
          prefixIcon: Icon(Icons.search, color: Colors.purple[300]),
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(vertical: 16, horizontal: 12),
        ),
        style: TextStyle(color: Colors.black87),
      ),
    );
  }
}
