import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:yafsa/yafsa/presentation/feature/main/catalog/filter/core/components/layout/layout_empty.dart';
import 'package:yafsa/yafsa/presentation/feature/main/catalog/filter/core/components/layout/layout_error.dart';
import 'package:yafsa/yafsa/presentation/feature/main/catalog/filter/core/components/layout/layout_loading.dart';
import 'package:yafsa/yafsa/presentation/feature/main/catalog/filter/core/components/widget/book_item.dart';

import '../../../../../domain/model/book_domain_model.dart';
import '../../../../core/navigation/direction/navigation_direction.dart';
import '../../../../core/util/custom_debounce.dart';
import '../catalog/core/ui/widget/loading_item.dart';
import 'bloc/filter_bloc.dart';
import 'bloc/filter_event.dart';
import 'bloc/filter_state.dart';
import 'core/components/widget/filter_header.dart';

class FilterView extends StatefulWidget {
  const FilterView({super.key});

  @override
  State<FilterView> createState() => _FilterView();
}

class _FilterView extends State<FilterView> {
  final ScrollController _scrollController = ScrollController();
  final FilterController filterController = FilterController();

  late CustomDebounce debounce;
  final _filterBloc = FilterBloc();
  bool isAsc = false;

  @override
  void initState() {
    super.initState();
    _filterBloc.add(InitialLoadFilterEvent());
    debounce = CustomDebounce(delay: const Duration(seconds: 2));
    _scrollController.addListener(() {
      filterController.setVisibility(_scrollController.offset != 0.0);

      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        _getMoreData();
      }
    });
  }

  void _getMoreData() {
    _filterBloc.add(LoadMoreFilterEvent());
  }

  @override
  Widget build(BuildContext context) {

    return Material(
      child: SafeArea(
          child: Column(
        children: [
          BlocBuilder<FilterBloc, FilterState>(
              bloc: _filterBloc,
              builder: (context, state) {
                return FilterHeader(
                  isCopyright: state.copyright,
                  onChanged: (value) => setState(() {
                    _filterBloc.add(CopyrightFilterEvent(value));
                  }),
                  isAsc: isAsc,
                  onPressed: () {
                    isAsc = !isAsc;
                    _filterBloc.add(SortFilterEvent(isAsc));
                  },
                  onChangeFoo: (allSelectedItems, selectedItem) {
                    _filterBloc.add(LangFilterEvent(allSelectedItems));
                  },
                  filterController: filterController,
                );
              }),
          Expanded(
              child: BlocBuilder<FilterBloc, FilterState>(
                  bloc: _filterBloc,
                  builder: (context, state) {
                    if (state is FilterLoadedState) {
                      return ListView.builder(
                        controller: _scrollController,
                        itemBuilder: (context, i) {
                          if (i == state.result.length) {
                            return LoadingItem();
                          }
                          BookDomainModel book = state.result[i];
                          return Padding(
                              padding: EdgeInsets.fromLTRB(16, 8, 16, 8),
                              child: BookItem(
                                book: book,
                                onTap: () {
                                  context.push(
                                      DetalizationDirection.getPath(book.id));
                                },
                              ));
                        },
                        itemCount: state.result.length + 1,
                      );
                    }
                    if (state is FilterLoadingState) {
                      return LoadingLayout();
                    }
                    if (state is FilterEmptyState) {
                      return EmptyLayout();
                    }
                    if (state is FilterErrorState) {
                      return ErrorLayout();
                    }
                    return EmptyLayout();
                  })),
        ],
      )),
    );
  }
}
