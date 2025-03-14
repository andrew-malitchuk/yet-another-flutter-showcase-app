import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../button/icon/icon_button.dart';

class SimpleHeader extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;

  const SimpleHeader({super.key, required this.title, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    return Container(
        child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Row(
              children: [
                CustomIconButton(
                  icon: SvgPicture.asset(
                    'assets/svg/icon-arrow-left-24.svg',
                    height: 16.0,
                    width: 16.0,
                    color: colorScheme.onPrimary,
                  ),
                  onPressed: onPressed,
                ),
                Expanded(
                    child: Center(
                        child: Padding(
                            padding: EdgeInsets.only(right: 24.0),
                            child: Text(title,
                                style: textTheme.bodyLarge?.copyWith(
                                    color: colorScheme.onPrimary))))),
              ],
            )));
  }
}
