import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_mobile_challenge_pragma/app/core/bloc/cats_bloc/cat_list_bloc.dart';
import 'package:flutter_mobile_challenge_pragma/app/core/bloc/cats_bloc/cat_list_event.dart';
import 'package:flutter_mobile_challenge_pragma/app/core/bloc/cats_bloc/cat_list_state.dart';
import 'package:flutter_mobile_challenge_pragma/app/core/models/filter_model.dart';
import 'package:flutter_mobile_challenge_pragma/app/core/router/go_router/app_routes_enum.dart';
import 'package:flutter_mobile_challenge_pragma/app/core/widget/app_base_page.dart';
import 'package:flutter_mobile_challenge_pragma/app/core/widget/cat_card.dart';
import 'package:flutter_mobile_challenge_pragma/app/core/widget/text_form_field.dart';
import 'package:flutter_mobile_challenge_pragma/app/domain/models/cat_item_list_data_model.dart';
import 'package:go_router/go_router.dart';

class LeadingPage extends StatefulWidget {
  const LeadingPage({super.key});

  @override
  State<LeadingPage> createState() => _LeadingPageState();
}

class _LeadingPageState extends State<LeadingPage> {
  final catsCurrent = <CatItemListDataModel>[];
  FilterModel filter = FilterModel();
  final scrollController = ScrollController();
  final searchCtrl = TextEditingController();

  @override
  void initState() {
    super.initState();
    context.read<CatBloc>().add(CatEvent.catGetInitial(filter));
    scrollController.addListener(() {
      if (scrollController.position.pixels == scrollController.position.maxScrollExtent) {
        //actions
        context.read<CatBloc>().add(CatEvent.catByPagination(filter, catsCurrent));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return AppBasePage(
      title: 'Leading Page',
      bodyWidget: BlocListener<CatBloc, CatState>(
        listener: (context, state) {
          state.mapOrNull(
            failure: (value) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(value.error),
                  behavior: SnackBarBehavior.floating,
                  backgroundColor: Colors.red,
                  duration: const Duration(seconds: 2),
                ),
              );
            },
            catsLoaded: (value) {
              if (!value.isRecovery) {
                catsCurrent
                  ..clear()
                  ..addAll(value.cats);
                filter = filter.copyWith(page: value.page);
              } else {
                filter = filter.copyWith(page: value.page);
                context.read<CatBloc>().add(CatEvent.catByPagination(filter, catsCurrent));
              }
            },
            loading: (value) {},
          );
        },
        child: Column(
          children: [
            TextFormSearchField(
              controller: searchCtrl,
              onFieldSubmitted: (value) {
                context.pushNamed(AppRoutes.catSearchList.name, extra: value).then((value) {
                  searchCtrl.text = '';
                });
              },
            ),

            SizedBox(height: 10),
            Expanded(
              child: BlocBuilder<CatBloc, CatState>(
                builder: (context, state) {
                  return ListView.builder(
                    controller: scrollController,
                    shrinkWrap: true,
                    itemCount:
                        (state is CatsListLoadedState || state is CatsListSearchLoadedState)
                            ? catsCurrent.length
                            : catsCurrent.length + 1,
                    itemBuilder: (context, index) {
                      if (index == catsCurrent.length || catsCurrent.isEmpty) {
                        return const Center(child: CircularProgressIndicator(color: Colors.white));
                      }
                      final catItem = catsCurrent[index];
                      return CatCard(catItem: catItem);
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
