// ignore_for_file: lines_longer_than_80_chars, depend_on_referenced_packages

import 'package:flutter_mobile_challenge_pragma/app/core/models/filter_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'cat_list_event.freezed.dart';

@freezed
class CatEvent with _$CatEvent {
  factory CatEvent.initial() = InitialCatEvent;
  factory CatEvent.loading() = LoadingCatEvent;
  factory CatEvent.failure(String error) = FailureCatEvent;

  // events
  factory CatEvent.catByPagination(FilterModel filter) = CatByPaginationEvent;
  factory CatEvent.catLoadMore(FilterModel filter) = LoadMoreCatEvent;
  factory CatEvent.catBySearch(String search) = CatBySearchEvent;
}
