// ignore_for_file: lines_longer_than_80_chars

import 'package:bloc/bloc.dart';
import 'package:flutter_mobile_challenge_pragma/app/core/bloc/cats_bloc/cat_list_event.dart';
import 'package:flutter_mobile_challenge_pragma/app/core/bloc/cats_bloc/cat_list_state.dart';
import 'package:flutter_mobile_challenge_pragma/app/domain/repository/i_cat_repository.dart';
import 'package:flutter_mobile_challenge_pragma/app/main.dart';

class CatBloc extends Bloc<CatEvent, CatState> {
  CatBloc() : super(CatState.initial()) {
    on<CatByPaginationEvent>(catByPaginationEvent);
    on<CatGetInitialEvent>(catGetInitialEvent);
    on<CatBySearchEvent>(catBySearchEvent);
  }

  final catRepository = getItApp.get<ICatRepository>();

  Future<void> catByPaginationEvent(CatByPaginationEvent event, Emitter<CatState> emit) async {
    final currentState = state;
    if (currentState is CatsListLoadedState) {
      final hasReachedMaxCurrent = currentState.hasReachedMax;
      final catsCurrent = currentState.cats;
      if (hasReachedMaxCurrent) {
        emit(CatState.loading());
        final newFilter = event.filter.copyWith(page: event.filter.page + 1);
        final result = await catRepository.getCatsByPagination(newFilter);

        result.when(
          left: (failure) => emit(CatState.failure(failure)),
          right: (catsAdditional) {
            final catsNews = catsCurrent + catsAdditional;
            final hasReachedMaxNew = catsAdditional.isNotEmpty;

            emit(
              CatState.catsLoaded(
                cats: catsNews,
                hasReachedMax: hasReachedMaxNew,
                page: newFilter.page,
                isRecovery: false,
              ),
            );
          },
        );
      }
    }
    if (currentState is CatsListSearchLoadedState) {
      emit(
        CatState.catsLoaded(cats: event.catsRecovery, hasReachedMax: true, page: event.filter.page, isRecovery: true),
      );
    }
  }

  Future<void> catGetInitialEvent(CatGetInitialEvent event, Emitter<CatState> emit) async {
    emit(CatState.loading());
    final result = await catRepository.getCatsByPagination(event.filter);

    result.when(
      left: (failure) => emit(CatState.failure(failure)),
      right:
          (cats) =>
              emit(CatState.catsLoaded(cats: cats, hasReachedMax: true, page: event.filter.page, isRecovery: false)),
    );
  }

  Future<void> catBySearchEvent(CatBySearchEvent event, Emitter<CatState> emit) async {
    emit(CatState.loading());
    final data = await catRepository.getCatsBySearch(event.search);
    data.when(left: (error) => emit(CatState.failure(error)), right: (cats) => emit(CatState.catsSearchLoaded(cats)));
  }
}
