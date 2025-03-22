import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../generated/l10n.dart';
import '../../../../core/navigation/direction/navigation_direction.dart';
import '../../../../core/ui/widget/button/item/item_button.dart';

class MenuView extends StatefulWidget {
  const MenuView({super.key});

  @override
  _MenuView createState() => _MenuView();
}

class _MenuView extends State<MenuView> {
  @override
  Widget build(BuildContext context) {

    return Material(
        child: SafeArea(
            child: SingleChildScrollView(
      child: Padding(
          padding: EdgeInsets.fromLTRB(16, 8, 16, 8),
          child: Column(
            children: [
              CustomItemButton(
                icon: 'assets/svg/icon-info-24.svg',
                title: S.of(context).menu_about,
                onPressed: () {
                  context.go(AboutDirection.tab);
                },
              ),
              Padding(padding: EdgeInsets.only(top: 8)),
              CustomItemButton(
                icon: 'assets/svg/icon-settings-24.svg',
                title: S.of(context).menu_settings,
                onPressed: () {
                  context.go(PreferenceDirection.tab);
                },
              ),
              Padding(padding: EdgeInsets.only(top: 8)),
              CustomItemButton(
                icon: 'assets/svg/icon-globe-24.svg',
                title: S.of(context).menu_language,
                onPressed: () {
                  context.go(LanguageDirection.tab);
                },
              ),
            ],
          )),
    )));
  }
}
