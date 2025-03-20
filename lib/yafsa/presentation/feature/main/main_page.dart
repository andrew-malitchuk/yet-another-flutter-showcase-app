import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:yafsa/yafsa/presentation/core/ui/widget/nav_bar/nav_bar.dart';

import '../../../../generated/l10n.dart';
import '../../core/ui/widget/nav_bar/nav_tab_button.dart';

class MainPage extends StatefulWidget {
  const MainPage({
    super.key,
    required this.navigationShell,
  });

  final StatefulNavigationShell navigationShell;

  @override
  State<MainPage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.onPrimary,
      bottomNavigationBar: BottomNavigationWidget(
        currentIndex: widget.navigationShell.currentIndex,
        onTap: _switchBranch,
      ),
      body: ClipRRect(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20), // Clip the bottom-left corner
          bottomRight: Radius.circular(20.0), // Clip the bottom-right corner
        ),
        child: widget.navigationShell,
      ),
    );
  }

  void _switchBranch(int index) {
    widget.navigationShell.goBranch(
      index,
      // A common pattern when using bottom navigation bars is to support
      // navigating to the initial location when tapping the item that is
      // already active. This example demonstrates how to support this behavior,
      // using the initialLocation parameter of goBranch.
      initialLocation: index == widget.navigationShell.currentIndex,
    );
  }
}

class BottomNavigationWidget extends StatelessWidget {
  const BottomNavigationWidget({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  final int currentIndex;
  final Function(int) onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    return NavBar(
        gap: 16,
        backgroundColor: colorScheme.onPrimary,
        color: colorScheme.error,
        activeColor: colorScheme.onSecondary,
        rippleColor: Colors.transparent,
        hoverColor: Colors.transparent,
        iconSize: 20,
        textStyle: textTheme.headlineSmall!,
        tabBackgroundColor: colorScheme.error,
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16.5),
        duration: Duration(milliseconds: 800),
        onTabChange: onTap,
        tabs: [
          TabButton(
              icon: 'assets/svg/icon-home-24.svg', // Path to your SVG file
              text: S.of(context).main_tab_home,
              textStyle: textTheme.bodyLarge),
          TabButton(
              icon: 'assets/svg/icon-catalog-24.svg', // Path to your SVG file
              text: S.of(context).main_tab_catalog,
              textStyle: textTheme.bodyLarge),
          TabButton(
              icon: 'assets/svg/icon-book-24.svg', // Path to your SVG file
              text: S.of(context).main_tab_library,
              textStyle: textTheme.bodyLarge),
          TabButton(
              icon: 'assets/svg/icon-menu-24.svg',
              text: S.of(context).main_tab_menu,
              textStyle: textTheme.bodyLarge),
        ]);
  }
}
