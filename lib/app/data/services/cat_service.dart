import 'package:dio/dio.dart';
import 'package:flutter_mobile_challenge_pragma/app/config/either/either.dart';
import 'package:flutter_mobile_challenge_pragma/app/core/models/filter_model.dart';
import 'package:flutter_mobile_challenge_pragma/app/domain/models/cat_item_list_data_model.dart';
import 'package:flutter_mobile_challenge_pragma/app/main.dart';

class CatService {
  final _dio = getItApp.get<Dio>();

  Future<Either<String, List<CatItemListDataModel>>> getCatsByPagination(FilterModel filterModel) async {
    try {
      const path = 'breeds/';

      final response = await _dio.post(
        path,
        queryParameters: {
          'page': filterModel.page,
          'limit': filterModel.limit,
          // 'q': filterModel.q,
        },
      );
      var results =
          (response.data['result'] as List)
              .map((i) => CatItemListDataModel.fromJson(i as Map<String, dynamic>))
              .toList();

      return Either.right(results);
    } catch (e) {
      return Either.left(e.toString());
    }
  }

  Future<Either<String, List<CatItemListDataModel>>> getCatsBySearch(String search) async {
    try {
      const path = 'breeds/search';

      final response = await _dio.post(path, queryParameters: {'q': search});
      var results =
          (response.data['result'] as List)
              .map((i) => CatItemListDataModel.fromJson(i as Map<String, dynamic>))
              .toList();

      return Either.right(results);
    } catch (e) {
      return Either.left(e.toString());
    }
  }
}
