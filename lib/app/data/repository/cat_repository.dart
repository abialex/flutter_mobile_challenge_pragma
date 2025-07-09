import 'package:flutter_mobile_challenge_pragma/app/config/either/either.dart';
import 'package:flutter_mobile_challenge_pragma/app/core/models/filter_model.dart';
import 'package:flutter_mobile_challenge_pragma/app/data/services/cat_service.dart';
import 'package:flutter_mobile_challenge_pragma/app/domain/models/cat_item_list_data_model.dart';
import 'package:flutter_mobile_challenge_pragma/app/domain/repository/i_cat_repository.dart';
import 'package:flutter_mobile_challenge_pragma/app/main.dart';

class CatRepository implements ICatRepository {
  final _service = getItApp.get<CatService>();

  @override
  Future<Either<String, List<CatItemListDataModel>>> getCatsByPagination(FilterModel filterModel) {
    return _service.getCatsByPagination(filterModel);
  }

  @override
  Future<Either<String, List<CatItemListDataModel>>> getCatsBySearch(String search) {
    return _service.getCatsBySearch(search);
  }
}
