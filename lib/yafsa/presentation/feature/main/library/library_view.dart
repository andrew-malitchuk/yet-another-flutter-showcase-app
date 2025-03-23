import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../domain/model/book_domain_model.dart';
import '../../../core/navigation/direction/navigation_direction.dart';
import '../catalog/catalog/core/ui/layout/layout_empty.dart';
import '../catalog/catalog/core/ui/layout/layout_error.dart';
import '../catalog/catalog/core/ui/layout/layout_loading.dart';
import '../catalog/catalog/core/ui/widget/book_item.dart';
import 'bloc/library_bloc.dart';
import 'bloc/library_event.dart';
import 'bloc/library_state.dart';

class LibraryView extends StatefulWidget {
  const LibraryView({super.key});

  @override
  State<LibraryView> createState() => _LibraryViewState();
}

class _LibraryViewState extends State<LibraryView> {
  final ScrollController _scrollController = ScrollController();
  final _libraryBloc = LibraryBloc();

  @override
  void initState() {
    super.initState();
    _libraryBloc.add(LoadLibraryEvent());
    _scrollController.addListener(() {});
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _checkIfActive();
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _checkIfActive();
  }

  void _checkIfActive() {
    final currentRoute = GoRouter.of(context)
        .routerDelegate
        .currentConfiguration
        .last
        .matchedLocation;
    if ('/library' == currentRoute) {
      _libraryBloc.add(LoadLibraryEvent());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        child: SafeArea(
            child: BlocBuilder<LibraryBloc, LibraryState>(
      bloc: _libraryBloc,
      builder: (context, state) {
        if (state is LibraryLoadedState) {
          return ListView.builder(
            itemCount: state.libraryList.length,
            itemBuilder: (context, i) {
              BookDomainModel book = state.libraryList[i];
              return Padding(
                  padding: EdgeInsets.fromLTRB(16, 8, 16, 8),
                  child: BookItem(
                      book: book,
                      onTap: () {
                        context.push(DetalizationDirection.getPath(book.id));
                      }));
            },
          );
        }
        if (state is LibraryErrorState) {
          return ErrorLayout();
        }
        if (state is LibraryLoadingState) {
          return LoadingLayout();
        }
        return EmptyLayout();
      },
    )));
  }
}
