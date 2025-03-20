import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:yafsa/generated/l10n.dart';
import 'package:yafsa/yafsa/domain/model/book_domain_model.dart';
import 'package:yafsa/yafsa/presentation/core/navigation/direction/navigation_direction.dart';
import 'package:yafsa/yafsa/presentation/feature/main/home/core/components/widget/book_recommendation_item.dart';

import '../library/core/ui/layout_error.dart';
import '../library/core/ui/layout_loading.dart';
import 'bloc/home_bloc.dart';
import 'bloc/home_event.dart';
import 'bloc/home_state.dart';
import 'core/components/widget/book_recent_item.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final _homeBloc = HomeBloc();

  @override
  void initState() {
    _homeBloc.add(LoadHomeEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    return Material(
        child: SafeArea(
            child: BlocBuilder<HomeBloc, HomeState>(
      bloc: _homeBloc,
      builder: (context, state) {
        if (state is HomeLoadedState) {
          return SingleChildScrollView(
            child: Container(
              color: colorScheme.surface,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                      padding: EdgeInsets.all(16),
                      child: Text(S.of(context).home_recommendation,
                          style: textTheme.displaySmall
                              ?.copyWith(color: colorScheme.secondary))),
                  SizedBox(
                      height: 250, // Constrain the height
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: state.recommendationList?.length ?? 0,
                          itemBuilder: (context, index) {
                            BookDomainModel book = state
                                .recommendationList?[index] as BookDomainModel;
                            return Padding(
                                padding: EdgeInsets.symmetric(horizontal: 16.0),
                                child: BookRecommendationItem(
                                  book: book,
                                  onTap: () {
                                    context.push(
                                        DetalizationDirection.getPath(book.id));
                                  },
                                ));
                          })),
                  Padding(
                      padding: EdgeInsets.all(16),
                      child: Text(S.of(context).home_recent,
                          style: textTheme.displaySmall
                              ?.copyWith(color: colorScheme.secondary))),
                  Column(
                      children: (state.recommendationList ?? [])
                          .map((it) => Padding(
                              padding: EdgeInsets.fromLTRB(16, 8, 16, 8),
                              child: BookRecentItem(
                                book: it,
                                onTap: () {
                                  context.push(
                                      DetalizationDirection.getPath(it.id));
                                },
                              )))
                          .toList())
                ],
              ),
            ),
          );
        }
        if (state is HomeErrorState) {
          return ErrorLayout();
        }
        return LoadingLayout();
      },
    )));
  }
}
