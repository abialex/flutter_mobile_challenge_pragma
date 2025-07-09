// ignore_for_file: lines_longer_than_80_chars, depend_on_referenced_packages

import 'package:flutter_mobile_challenge_pragma/app/domain/models/cat_item_list_data_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'cat_list_state.freezed.dart';

@freezed
class CatState with _$CatState {
  const CatState._();
  factory CatState.initial() = CatInitialState;
  factory CatState.loading() = CatLoadingState;
  factory CatState.failure(String error) = CatErrorState;

  // states
  factory CatState.catsLoaded({
    required List<CatItemListDataModel> cats,
    required bool hasReachedMax,
    required int page,
  }) = CatsListLoadedState;
  factory CatState.catsSearchLoaded(List<CatItemListDataModel> cats) = CatsListSearchLoadedState;
}
