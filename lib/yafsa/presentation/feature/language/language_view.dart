import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../generated/l10n.dart';
import '../../../../main.dart';
import '../../core/ui/widget/header/header_simple.dart';
import 'bloc/language_bloc.dart';
import 'bloc/language_event.dart';
import 'bloc/language_state.dart';

class LanguageView extends StatefulWidget {
  const LanguageView({super.key});

  @override
  State<LanguageView> createState() => _LanguageViewState();
}

class _LanguageViewState extends State<LanguageView> {
  final _languageBloc = LanguageBloc();

  _LanguageViewState();

  @override
  void initState() {
    _languageBloc.add(LoadLanguageEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        child: SafeArea(
            child: Column(children: [
      SimpleHeader(
        title: S.of(context).menu_language,
        onPressed: () {
          GoRouter.of(context).pop();
        },
      ),
      Expanded(
          child: SingleChildScrollView(
              child: Padding(
                  padding: EdgeInsets.fromLTRB(16, 8, 16, 8),
                  child: SafeArea(
                      child: BlocBuilder<LanguageBloc, LanguageState>(
                          bloc: _languageBloc,
                          builder: (context, state) {
                            if (state == LanguageErrorState()) {
                              return const Center(child: Text('Error'));
                            } else if (state is LanguageLoadedState) {
                              return Column(
                                children: [
                                  Text(state.language.languageCode),
                                  OutlinedButton(
                                      onPressed: () {
                                        _languageBloc.add(SetLanguageEvent(
                                            lang: Locale('uk', 'UA')));
                                        MyApp.setLocale(context,
                                            Locale('uk', 'UA') // Ukrainian
                                            );
                                      },
                                      child: Text("uk")),
                                  OutlinedButton(
                                      onPressed: () {
                                        _languageBloc.add(SetLanguageEvent(
                                            lang: Locale('en', '')));
                                        MyApp.setLocale(context,
                                            Locale('en', '') // Ukrainian
                                            );
                                      },
                                      child: Text("en")),
                                ],
                              );
                            } else {
                              return const Center(
                                  child: CircularProgressIndicator());
                            }
                          })))))
    ])));
  }
}
