import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_mobile_challenge_pragma/app/core/bloc/cats_bloc/cat_list_bloc.dart';
import 'package:flutter_mobile_challenge_pragma/app/core/bloc/cats_bloc/cat_list_event.dart';
import 'package:flutter_mobile_challenge_pragma/app/core/bloc/cats_bloc/cat_list_state.dart';
import 'package:flutter_mobile_challenge_pragma/app/core/router/go_router/app_routes_enum.dart';
import 'package:flutter_mobile_challenge_pragma/app/core/widget/app_base_page.dart';
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
  @override
  void initState() {
    super.initState();
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
        bodyWidget: Column(
          children: [
            TextFormField(
              decoration: InputDecoration(labelText: "Search", border: OutlineInputBorder()),
              onFieldSubmitted: (value) {
                context.read<CatBloc>().add(CatEvent.catBySearch(value));
              },
            ),
            Expanded(
              child: BlocBuilder<CatBloc, CatState>(
                builder: (context, state) {
                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: catsCurrent.length,
                    itemBuilder: (context, index) {
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
