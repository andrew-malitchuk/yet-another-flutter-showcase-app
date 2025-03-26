import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:yafsa/yafsa/presentation/feature/main/catalog/search/core/ui/layout/layout_empty.dart';
import 'package:yafsa/yafsa/presentation/feature/main/catalog/search/core/ui/layout/layout_error.dart';
import 'package:yafsa/yafsa/presentation/feature/main/catalog/search/core/ui/layout/layout_loading.dart';
import 'package:yafsa/yafsa/presentation/feature/main/catalog/search/core/ui/widget/header_search.dart';

import '../../../../../../generated/l10n.dart';
import '../../../../../domain/model/book_domain_model.dart';
import '../../../../core/navigation/direction/navigation_direction.dart';
import '../../../../core/util/custom_debounce.dart';
import '../catalog/core/ui/widget/book_item.dart';
import 'bloc/search_bloc.dart';
import 'bloc/search_event.dart';
import 'bloc/search_state.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchView();
}

class _SearchView extends State<SearchView> {
  late CustomDebounce debounce;
  final _searchBloc = SearchBloc();
  final FocusNode _focusNode = FocusNode();
  final ScrollController _scrollController = ScrollController();

  final SearchHeaderController searchHeaderController =
      SearchHeaderController();

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _searchBloc.add(InitialLoadSearchEvent());
    debounce = CustomDebounce(delay: const Duration(seconds: 2));
    _scrollController.addListener(() {
      searchHeaderController.setVisibility(_scrollController.offset != 0.0);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        child: SafeArea(
            child: Column(children: [
      SearchHeader(
          action: "assets/svg/icon-arrow-left-24.svg",
          onActionPressed: () {
            GoRouter.of(context).pop();
          },
          searchHeaderController: searchHeaderController,
          onChanged: (it) {
            _onChange(it);
          }),
      Expanded(
          child: BlocBuilder<SearchBloc, SearchState>(
              bloc: _searchBloc,
              builder: (context, state) {
                if (state is SearchLoadingState) {
                  return LoadingLayout();
                }
                if (state is SearchLoadedState) {
                  return ListView.builder(
                      controller: _scrollController,
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, index) {
                        BookDomainModel book = state.result.results[index];
                        return Padding(
                            padding: EdgeInsets.fromLTRB(16, 8, 16, 8),
                            child: BookItem(
                              book: book,
                              onTap: () {
                                context.push(
                                    DetalizationDirection.getPath(book.id));
                              },
                            ));
                      });
                }
                if (state is SearchEmptyState) {
                  return EmptyLayout();
                }
                if (state is SearchErrorState) {
                  return ErrorLayout();
                }
                if (state is SearchInitialState) {
                  return Text(S.of(context).search_type_to_search);
                }
                return EmptyLayout();
              })),
    ])));
  }

  void _onChange(String value) {
    debounce(
      () async {
        _searchBloc.add(QuerySearchEvent(value));
      },
    );
  }
}
