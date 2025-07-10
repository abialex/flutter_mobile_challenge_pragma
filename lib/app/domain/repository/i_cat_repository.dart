import 'package:flutter_mobile_challenge_pragma/app/config/either/either.dart';
import 'package:flutter_mobile_challenge_pragma/app/core/models/filter_model.dart';
import 'package:flutter_mobile_challenge_pragma/app/domain/models/cat_item_list_data_model.dart';

abstract class ICatRepository {
  Future<Either<String, List<CatItemListDataModel>>> getCatsByPagination(FilterModel filterModel);
  Future<Either<String, List<CatItemListDataModel>>> getCatsBySearch(String search);
}
