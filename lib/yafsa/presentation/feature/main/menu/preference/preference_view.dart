import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../../generated/l10n.dart';
import '../../../../../../main.dart';
import '../../../../core/ui/theme/notifier/theme_notifier.dart';
import '../../../../core/ui/widget/header/header_simple.dart';

class PreferenceView extends StatefulWidget {
  const PreferenceView({super.key});

  @override
  _PreferenceView createState() => _PreferenceView();
}

class _PreferenceView extends State<PreferenceView> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;
    final themeProvider = Provider.of<ThemeNotifier>(context);

    return Material(
        child: SafeArea(
            child: Column(children: [
      SimpleHeader(
        title: S.of(context).menu_settings,
        onPressed: () {
          GoRouter.of(context).pop();
        },
      ),
      Expanded(
          child: SingleChildScrollView(
        child: Padding(
            padding: EdgeInsets.fromLTRB(16, 8, 16, 8),
            child: Column(
              children: [
                Row(children: [
                  Text(
                    S.of(context).preference_dark_mode,
                    textAlign: TextAlign.start,
                    style: textTheme.headlineSmall
                        ?.copyWith(color: colorScheme.onPrimary),
                  ),
                  Spacer(),
                  CupertinoSwitch(
                    thumbColor: colorScheme.secondary,
                    activeTrackColor: colorScheme.primary,
                    inactiveTrackColor: colorScheme.onSecondary,
                    value: themeProvider.isDarkMode,
                    onChanged: (value) async {
                      SharedPreferences prefs =
                          await SharedPreferences.getInstance();
                      prefs.setBool(keyTheme, value);
                      themeProvider.toggleTheme();
                    },
                  )
                ]),
              ],
            )),
      ))
    ])));
  }

  static const String keyTheme = 'theme';
}
