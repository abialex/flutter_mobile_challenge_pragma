import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_mobile_challenge_pragma/app/core/bloc/cats_bloc/cat_list_bloc.dart';
import 'package:flutter_mobile_challenge_pragma/app/core/bloc/cats_bloc/cat_list_event.dart';
import 'package:flutter_mobile_challenge_pragma/app/core/bloc/cats_bloc/cat_list_state.dart';
import 'package:flutter_mobile_challenge_pragma/app/core/widget/app_base_page.dart';
import 'package:flutter_mobile_challenge_pragma/app/core/widget/cat_card.dart';
import 'package:flutter_mobile_challenge_pragma/app/core/widget/text_form_field.dart';
import 'package:flutter_mobile_challenge_pragma/app/domain/models/cat_item_list_data_model.dart';
import 'package:go_router/go_router.dart';

class CatSearchListPage extends StatefulWidget {
  const CatSearchListPage({super.key, this.searchQuery});
  final String? searchQuery;

  @override
  State<CatSearchListPage> createState() => _CatSearchListPageState();
}

class _CatSearchListPageState extends State<CatSearchListPage> {
  final catsCurrent = <CatItemListDataModel>[];
  final searchCtrl = TextEditingController();
  @override
  void initState() {
    super.initState();
    searchCtrl.text = widget.searchQuery ?? '';
    context.read<CatBloc>().add(CatEvent.catBySearch(widget.searchQuery ?? ''));
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<CatBloc, CatState>(
      listener: (context, state) {
        state.mapOrNull(
          catsSearchLoaded: (value) {
            catsCurrent
              ..clear()
              ..addAll(value.cats);
          },
        );
      },
      child: AppBasePage(
        title: 'Cat Search',
        bodyWidget: Column(
          children: [
            TextFormSearchField(
              controller: searchCtrl,
              onFieldSubmitted: (value) {
                if (value.isEmpty) {
                  return;
                }
                context.read<CatBloc>().add(CatEvent.catBySearch(value));
              },
            ),
            SizedBox(height: 10),

            Expanded(
              child: BlocBuilder<CatBloc, CatState>(
                builder: (context, state) {
                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: catsCurrent.length,
                    itemBuilder: (context, index) {
                      final catItem = catsCurrent[index];
                      return CatCard(catItem: catItem);
                    },
                  );
                },
              ),
            ),
            ElevatedButton(
              onPressed: () {
                context.pop();
              },
              child: Text('Atras'),
            ),
          ],
        ),
      ),
    );
  }
}
