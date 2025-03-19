import 'package:flutter/material.dart';

class OnboardingPage extends StatelessWidget {
  String title;
  String description;

  OnboardingPage({super.key, required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    return Expanded(
        child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: Container(
                decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.circular(16), // Set rounded corners here
                ),
                clipBehavior: Clip.antiAlias,
                child: Container(
                    color: colorScheme.primary,
                    child: Padding(
                        padding: EdgeInsets.all(8),
                        child: Center(
                            heightFactor: 1,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(title,
                                    style: textTheme.displayLarge?.copyWith(
                                        color: colorScheme.secondary)),
                                Text(description,
                                    style: textTheme.displaySmall?.copyWith(
                                        color: colorScheme.secondary)),
                              ],
                            )))))));
  }
}
