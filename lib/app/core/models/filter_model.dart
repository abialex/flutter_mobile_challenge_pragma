// ignore_for_file: depend_on_referenced_packages

import 'package:freezed_annotation/freezed_annotation.dart';

part 'filter_model.freezed.dart';

@freezed
class FilterModel with _$FilterModel {
  const factory FilterModel({
    @Default(1) int page,
    @Default(10) int limit,
    String? q,
    String? code,
    DateTime? date,
    String? parameter,
    String? parameter2,
  }) = _FilterModel;
}
