import 'package:flutter/material.dart';
import 'package:flutter_mobile_challenge_pragma/app/core/widget/app_base_page.dart';
import 'package:flutter_mobile_challenge_pragma/app/domain/models/cat_item_list_data_model.dart';

class CatDetailPage extends StatelessWidget {
  const CatDetailPage({super.key, required this.catDetail});
  final CatItemListDataModel catDetail;

  @override
  Widget build(BuildContext context) {
    return AppBasePage(title: 'Cat Detail', bodyWidget: Column(children: [Text(catDetail.name)]));
  }
}
