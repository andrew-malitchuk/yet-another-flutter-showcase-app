import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:yafsa/yafsa/presentation/feature/main/catalog/catalog/bloc/catalog_event.dart';
import 'package:yafsa/yafsa/presentation/feature/main/catalog/catalog/bloc/catalog_state.dart';
import 'package:yafsa/yafsa/presentation/feature/main/catalog/catalog/core/ui/widget/loading_item.dart';

import '../../../../../domain/model/book_domain_model.dart';
import '../../../../core/navigation/direction/navigation_direction.dart';
import 'bloc/catalog_bloc.dart';
import 'core/ui/layout/layout_empty.dart';
import 'core/ui/layout/layout_error.dart';
import 'core/ui/layout/layout_loading.dart';
import 'core/ui/widget/book_item.dart';
import 'core/ui/widget/header_catalog.dart';

///
/// https://github.com/soumyasethy/flutter-lazyloading-bloc-pagination/blob/master/lib/blocs/data/data_bloc.dart
///
class CatalogView extends StatefulWidget {
  const CatalogView({super.key});

  @override
  _CatalogView createState() => _CatalogView();
}

class _CatalogView extends State<CatalogView> {
  final ScrollController _scrollController = ScrollController();
  final CatalogController catalogController = CatalogController();

  final _catalogBloc = CatalogBloc();

  @override
  void initState() {
    super.initState();

    //initial data load
    _catalogBloc.add(LoadCatalogEvent());

    //triggers when scrolling reached to bottom
    _scrollController.addListener(() {
      catalogController.setVisibility(_scrollController.offset != 0.0);

      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        _getMoreData();
      }
    });
  }

  void _getMoreData() {
    _catalogBloc.add(LoadMoreCatalogEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        child: SafeArea(
            child: Column(children: [
      CatalogHeader(
        mainAction: "assets/svg/icon-search-24.svg",
        additionalAction: "assets/svg/icon-filter-24.svg",
        onAdditionalActionPressed: () {
          context.go(FilterDirection.tab);
        },
        onMainActionPressed: () {
          context.go(SearchDirection.tab);
        },
        catalogController: catalogController,
      ),
      Expanded(
        child: BlocBuilder<CatalogBloc, CatalogState>(
          bloc: _catalogBloc,
          builder: (context, state) {
            if (state is CatalogLoadedState) {
              return ListView.builder(
                controller: _scrollController,
                itemBuilder: (context, i) {
                  if (i == state.myList.length) {
                    return LoadingItem();
                  }
                  BookDomainModel book = state.myList[i];
                  return Padding(
                      padding: EdgeInsets.fromLTRB(16, 8, 16, 8),
                      child: BookItem(
                          book: book,
                          onTap: () {
                            context
                                .push(DetalizationDirection.getPath(book.id));
                          }));
                },
                itemCount: state.myList.length + 1,
              );
            }
            if (state is CatalogLoadingState) {
              return LoadingLayout();
            }
            if (state is CatalogErrorState) {
              return ErrorLayout();
            }
            return EmptyLayout();
          },
        ),
      )
    ])));
  }
}
