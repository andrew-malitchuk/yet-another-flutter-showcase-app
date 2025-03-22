import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../../generated/l10n.dart';
import '../../../../core/ui/widget/button/item/item_button.dart';
import '../../../../core/ui/widget/header/header_simple.dart';

class AboutView extends StatefulWidget {
  const AboutView({super.key});

  @override
  _AboutView createState() => _AboutView();
}

class _AboutView extends State<AboutView> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    return Material(
        child: SafeArea(
            child: Column(children: [
      SimpleHeader(
        title: S.of(context).menu_about,
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
                Text(
                  textAlign: TextAlign.start,
                  softWrap: true,
                  overflow: TextOverflow.visible,
                  S.of(context).about_description,
                  style: textTheme.headlineSmall
                      ?.copyWith(color: colorScheme.onPrimary),
                ),
                Padding(padding: EdgeInsets.only(top: 24)),
                CustomItemButton(
                  icon: 'assets/svg/icon-github-24.svg',
                  title: S.of(context).about_github,
                  onPressed: () {
                    _launchInBrowser(Uri.parse(S.of(context).about_github_url));
                  },
                ),
              ],
            )),
      ))
    ])));
  }

  Future<void> _launchInBrowser(Uri url) async {
    if (!await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    )) {
      throw Exception('Could not launch $url');
    }
  }
}
