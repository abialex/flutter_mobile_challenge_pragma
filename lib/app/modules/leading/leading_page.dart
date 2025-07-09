import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_mobile_challenge_pragma/app/core/bloc/cats_bloc/cat_list_bloc.dart';
import 'package:flutter_mobile_challenge_pragma/app/core/bloc/cats_bloc/cat_list_event.dart';
import 'package:flutter_mobile_challenge_pragma/app/core/bloc/cats_bloc/cat_list_state.dart';
import 'package:flutter_mobile_challenge_pragma/app/core/models/filter_model.dart';
import 'package:flutter_mobile_challenge_pragma/app/core/router/go_router/app_routes_enum.dart';
import 'package:flutter_mobile_challenge_pragma/app/core/widget/app_base_page.dart';
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

  @override
  void initState() {
    super.initState();
    context.read<CatBloc>().add(CatEvent.catGetInitial(filter));
    scrollController.addListener(() {
      if (scrollController.position.pixels == scrollController.position.maxScrollExtent) {
        //actions
        context.read<CatBloc>().add(CatEvent.catByPagination(filter));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return AppBasePage(
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
              catsCurrent
                ..clear()
                ..addAll(value.cats);
              filter = filter.copyWith(page: value.page);
            },
            loading: (value) {},
          );
        },
        child: Column(
          spacing: 20,
          children: [
            Text("leading page"),
            TextFormField(
              decoration: InputDecoration(labelText: "Search", border: OutlineInputBorder()),
              onFieldSubmitted: (value) {
                context.push(AppRoutes.catSearchList.path, extra: value);
              },
            ),
            Expanded(
              child: BlocBuilder<CatBloc, CatState>(
                builder: (context, state) {
                  return ListView.builder(
                    controller: scrollController,
                    shrinkWrap: true,
                    itemCount: (state is CatsListLoadedState) ? catsCurrent.length : catsCurrent.length + 1,
                    itemBuilder: (context, index) {
                      if (index == catsCurrent.length || catsCurrent.isEmpty) {
                        return const Center(child: CircularProgressIndicator());
                      }
                      final catItem = catsCurrent[index];
                      return catItem.image?.url != null
                          ? AspectRatio(
                            aspectRatio: catItem.image!.width / catItem.image!.height,
                            child: InkWell(
                              onTap: () {
                                context.push(AppRoutes.catDetail.path, extra: catItem);
                              },
                              child: Image.network(
                                gaplessPlayback: true,
                                catItem.image!.url,
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) {
                                  return const Icon(Icons.error, size: 50, color: Colors.red);
                                },
                                loadingBuilder: (context, child, loadingProgress) {
                                  if (loadingProgress == null) return child;
                                  return Center(
                                    child: CircularProgressIndicator(
                                      value:
                                          loadingProgress.expectedTotalBytes != null
                                              ? loadingProgress.cumulativeBytesLoaded /
                                                  (loadingProgress.expectedTotalBytes ?? 1)
                                              : null,
                                    ),
                                  );
                                },
                              ),
                            ),
                          )
                          : SizedBox.shrink();
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
