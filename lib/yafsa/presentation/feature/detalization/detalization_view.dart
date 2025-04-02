import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:yafsa/yafsa/domain/model/author_domain_model.dart';
import 'package:yafsa/yafsa/domain/model/book_domain_model.dart';
import 'package:yafsa/yafsa/presentation/feature/detalization/bloc/detalization_state.dart';

import '../../../../generated/l10n.dart';
import '../main/catalog/catalog/core/ui/layout/layout_error.dart';
import 'bloc/detalization_bloc.dart';
import 'bloc/detalization_event.dart';
import 'components/layout/layout_loading.dart';
import 'components/widget/header_detalization.dart';

class DetalizationView extends StatefulWidget {
  final String id;

  const DetalizationView(this.id, {super.key});

  @override
  State<DetalizationView> createState() => _DetalizationViewState(id);
}

class _DetalizationViewState extends State<DetalizationView> {
  final String id;

  final ScrollController _scrollController = ScrollController();
  final DetalizationController detalizationController =
      DetalizationController();

  final _detalizationBloc = DetalizationBloc();

  _DetalizationViewState(this.id);

  @override
  void initState() {
    _detalizationBloc.add(LoadDetailsEvent(int.parse(id)));
    super.initState();

    _scrollController.addListener(() {
      detalizationController.setVisibility(_scrollController.offset != 0.0);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        child: SafeArea(
            child: BlocBuilder<DetalizationBloc, DetalizationState>(
      bloc: _detalizationBloc,
      builder: (context, state) {
        if (state is DetalizationLoadedState) {
          return _generateContent(state.book, () {
            _detalizationBloc.add(ToggleDetailsEvent(state.book));
          });
        }
        if (state is DetalizationLoadingState) {
          return LoadingLayout();
        }
        if (state is DetalizationErrorState) {
          return ErrorLayout();
        }
        return LoadingLayout();
      },
    )));
  }

  Widget _generateContent(
      BookDomainModel book, VoidCallback onFavouritePressed) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    final DetalizationController detalizationController =
        DetalizationController();

    return Column(children: [
      DetalizationHeader(
        title: book.title,
        isSelected: book.isFavorite,
        onNavigationPressed: () {
          GoRouter.of(context).pop();
        },
        onFavouritePressed: onFavouritePressed,
        detalizationController: detalizationController,
      ),
      Expanded(
          flex: 1,
          child: SingleChildScrollView(
              controller: _scrollController,
              child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                            padding: EdgeInsets.all(16),
                            child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                      16), // Set rounded corners here
                                ),
                                clipBehavior: Clip.antiAlias,
                                // Ensure clipping is applied
                                child: AspectRatio(
                                  aspectRatio: 3 / 4,
                                  // Aspect ratio for book cover, adjust as needed
                                  child: (book.formats["image/jpeg"] ?? "")
                                          .isNotEmpty
                                      ? Image.network(
                                          book.formats["image/jpeg"] ?? "",
                                          fit: BoxFit.cover,
                                          loadingBuilder: (BuildContext context,
                                              Widget child,
                                              ImageChunkEvent?
                                                  loadingProgress) {
                                            if (loadingProgress == null) {
                                              return child;
                                            } else {
                                              return Center(
                                                child:
                                                    CircularProgressIndicator(
                                                  value: loadingProgress
                                                              .expectedTotalBytes !=
                                                          null
                                                      ? loadingProgress
                                                              .cumulativeBytesLoaded /
                                                          (loadingProgress
                                                                  .expectedTotalBytes ??
                                                              1)
                                                      : null,
                                                ),
                                              );
                                            }
                                          },
                                          errorBuilder:
                                              (context, error, stackTrace) {
                                            // Show solid color in case of an error (e.g., image not found)
                                            return Container(
                                              color: colorScheme
                                                  .primary, // Solid color if the image fails to load
                                            );
                                          },
                                        )
                                      : Container(
                                          color: colorScheme
                                              .primary, // Solid color if the image URL is empty
                                        ),
                                ))),
                        Row(
                          children: [
                            Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SvgPicture.asset(
                                    'assets/svg/icon-download-24.svg',
                                    height: 16.0,
                                    width: 16.0,
                                    color: colorScheme.secondary,
                                  ),
                                  Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 8),
                                      child: Text(
                                        (book.downloadCount ?? 0).toString(),
                                        style: textTheme.labelMedium,
                                      )),
                                ]),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              book.title,
                              style: textTheme.displaySmall
                                  ?.copyWith(color: colorScheme.secondary),
                              softWrap: true,
                              overflow: TextOverflow.ellipsis,
                            ),
                            Padding(
                                padding: EdgeInsets.symmetric(vertical: 8),
                                child: Text(S.of(context).book_author,
                                    style: textTheme.titleLarge?.copyWith(
                                        color: colorScheme.primary))),
                            ..._getAuthors(book.authors),
                            if (book.translators.isNotEmpty)
                              Padding(
                                  padding: EdgeInsets.symmetric(vertical: 8),
                                  child: Text(S.of(context).book_translators,
                                      style: textTheme.titleLarge?.copyWith(
                                          color: colorScheme.primary))),
                            ..._getAuthors(book.translators),
                          ],
                        ),
                        Padding(
                            padding: EdgeInsets.symmetric(vertical: 8),
                            child: Text(S.of(context).book_languages,
                                style: textTheme.titleLarge
                                    ?.copyWith(color: colorScheme.primary))),
                        Row(children: [..._getLanguages(book.languages)]),
                        Padding(
                            padding: EdgeInsets.symmetric(vertical: 8),
                            child: Text(S.of(context).book_subjects,
                                style: textTheme.titleLarge
                                    ?.copyWith(color: colorScheme.primary))),
                        Wrap(children: [..._getLanguages(book.subjects)]),
                        Padding(
                            padding: EdgeInsets.symmetric(vertical: 8),
                            child: Text(S.of(context).book_description,
                                style: textTheme.titleLarge
                                    ?.copyWith(color: colorScheme.primary))),
                        ..._getSummary(book.summaries),
                        Padding(
                            padding: EdgeInsets.symmetric(vertical: 8),
                            child: Text(S.of(context).book_formats,
                                style: textTheme.titleLarge
                                    ?.copyWith(color: colorScheme.primary))),
                        _getFormats(book.formats),
                      ]))))
    ]);
  }

  List<Widget> _getAuthors(List<AuthorDomainModel> authors) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    List<Widget> authorWidgets = [];
    for (var author in authors) {
      authorWidgets.add(
        Text(
          author.name,
          style: textTheme.bodyMedium?.copyWith(color: colorScheme.onPrimary),
          softWrap: true,
          overflow: TextOverflow.ellipsis,
        ),
      );
    }
    return authorWidgets;
  }

  List<Widget> _getSummary(List<String> summary) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    List<Widget> summaryWidgets = [];
    for (var it in summary) {
      summaryWidgets.add(Text(
        it,
        style: textTheme.bodyMedium?.copyWith(color: colorScheme.onPrimary),
        softWrap: true,
        overflow: TextOverflow.ellipsis,
      ));
    }
    return summaryWidgets;
  }

  List<Widget> _getLanguages(List<String> summary) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    List<Widget> summaryWidgets = [];
    for (var it in summary) {
      summaryWidgets.add(Text(
        it,
        style: textTheme.bodyMedium?.copyWith(color: colorScheme.onPrimary),
        softWrap: true,
        overflow: TextOverflow.ellipsis,
      ));
    }
    return summaryWidgets;
  }

  Widget _getFormats(Map<String, String> formats) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    List<Widget> result = [];

    formats.forEach((key, value) {
      result.add(Padding(
          padding: EdgeInsets.all(4),
          child: Row(
            children: [
              Expanded(
                  child: Text(
                key,
                style: textTheme.bodyMedium
                    ?.copyWith(color: colorScheme.onPrimary),
                softWrap: true,
                overflow: TextOverflow.ellipsis,
              )),
              Expanded(
                  child: GestureDetector(
                      onTap: () {
                        _launchUrl(value);
                      },
                      child: Text(
                        value,
                        style: textTheme.bodyMedium
                            ?.copyWith(color: colorScheme.onPrimary),
                        softWrap: true,
                        overflow: TextOverflow.ellipsis,
                      )))
            ],
          )));
    });

    return Column(
      children: [...result],
    );
  }

  Future<void> _launchUrl(String input) async {
    if (!await launchUrl(Uri.parse(input))) {
      throw Exception('Could not launch $input');
    }
  }
}
