import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../../../../../generated/l10n.dart';

class EmptyLayout extends StatelessWidget {
  const EmptyLayout({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    return Center(
        child: Column(
      children: [
        SvgPicture.asset(
          'assets/svg/icon-meh-24.svg',
          height: 128.0,
          width: 128.0,
          color: colorScheme.primary,
        ),
        Padding(
            padding: EdgeInsets.only(top: 8),
            child: Text(
              maxLines: 2,
              S.of(context).empty_title,
              style: textTheme.displaySmall,
            )),
        Padding(
            padding: EdgeInsets.only(top: 8),
            child: Text(
              maxLines: 2,
              S.of(context).empty_message,
              style: textTheme.titleMedium,
            )),
      ],
    ));
  }
}
