import 'package:flutter/material.dart';
import 'package:yafsa/yafsa/presentation/core/ui/widget/loading/loading_dots.dart';

class LoadingItem extends StatelessWidget {
  const LoadingItem({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Center(child: LoadingDots(color: colorScheme.primary, size: 64));
  }
}
