import 'package:flutter/material.dart';

class AppConstText {
  static Text extraHugeText({
    required String text,
    Color? color,
    FontWeight? fontWeight,
    TextDecoration? decoration,
    TextAlign? textAlign,
    int? maxLines,
  }) {
    return Text(
      text,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: maxLines != null ? TextOverflow.ellipsis : null,
      style: TextStyle(fontSize: 44, color: color, fontWeight: fontWeight, decoration: decoration),
    );
  }

  static Text hugeText({
    required String text,
    Color? color,
    FontWeight? fontWeight,
    TextDecoration? decoration,
    TextAlign? textAlign,
    int? maxLines,
  }) {
    return Text(
      text,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: maxLines != null ? TextOverflow.ellipsis : null,
      style: TextStyle(fontSize: 32, color: color, fontWeight: fontWeight, decoration: decoration),
    );
  }

  static Text extraLargeText({
    required String text,
    Color? color,
    FontWeight? fontWeight,
    TextDecoration? decoration,
    TextAlign? textAlign,
    int? maxLines,
  }) {
    return Text(
      text,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: maxLines != null ? TextOverflow.ellipsis : null,
      style: TextStyle(fontSize: 24, color: color, fontWeight: fontWeight, decoration: decoration),
    );
  }

  static Text largeText({
    required String text,
    Color? color,
    FontWeight? fontWeight,
    TextDecoration? decoration,
    TextAlign? textAlign,
    int? maxLines,
  }) {
    return Text(
      text,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: maxLines != null ? TextOverflow.ellipsis : null,
      style: TextStyle(fontSize: 20, color: color, fontWeight: fontWeight, decoration: decoration),
    );
  }

  static Text mediumText({
    required String text,
    Color? color,
    FontWeight? fontWeight,
    TextDecoration? decoration,
    TextAlign? textAlign,
    int? maxLines,
  }) {
    return Text(
      text,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: maxLines != null ? TextOverflow.ellipsis : null,
      style: TextStyle(fontSize: 16, color: color, fontWeight: fontWeight, decoration: decoration),
    );
  }

  static Text smallText({
    required String text,
    Color? color,
    FontWeight? fontWeight,
    TextDecoration? decoration,
    TextAlign? textAlign,
    int? maxLines,
  }) {
    return Text(
      text,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: maxLines != null ? TextOverflow.ellipsis : null,
      style: TextStyle(fontSize: 14, color: color, fontWeight: fontWeight, decoration: decoration),
    );
  }

  static Text miniText({
    required String text,
    Color? color,
    FontWeight? fontWeight,
    TextDecoration? decoration,
    TextAlign? textAlign,
    int? maxLines,
  }) {
    return Text(
      text,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: maxLines != null ? TextOverflow.ellipsis : null,
      style: TextStyle(fontSize: 12, color: color, fontWeight: fontWeight, decoration: decoration),
    );
  }

  static Text titleMedium({
    required String text,
    Color? color,
    FontWeight? fontWeight,
    TextDecoration? decoration,
    TextAlign? textAlign,
    int? maxLines,
  }) {
    return Text(
      text,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: maxLines != null ? TextOverflow.ellipsis : null,
      style: TextStyle(fontSize: 18, color: color, fontWeight: fontWeight, decoration: decoration),
    );
  }
}
