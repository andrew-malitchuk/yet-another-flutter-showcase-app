import 'package:flutter/material.dart';
import 'package:flutter_multi_select_items/flutter_multi_select_items.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../../../../../generated/l10n.dart';
import '../../../../../../../core/ui/widget/button/icon/icon_button.dart';
import '../../../../../../../core/ui/widget/switch/switch_advance.dart';

class FilterController extends ChangeNotifier {
  bool isVisibility = false;

  void setVisibility(bool visibility) {
    isVisibility = visibility;
    notifyListeners();
  }

  void setVisible() {
    setVisibility(true);
  }

  void setUnvisible() {
    setVisibility(false);
  }
}

class FilterHeader extends StatefulWidget {
  final bool isAsc;
  final bool isCopyright;
  final ValueChanged<bool> onChanged;
  final VoidCallback onPressed;
  final void Function(List<String> selectedItems, String selectedItem)
      onChangeFoo;
  final FilterController filterController;

  const FilterHeader({
    super.key,
    required this.isAsc,
    required this.isCopyright,
    required this.onChanged,
    required this.onPressed,
    required this.onChangeFoo,
    required this.filterController,
  });

  @override
  State<StatefulWidget> createState() {
    return _FadeContainerState();
  }
}

class _FadeContainerState extends State<FilterHeader> {
  double _opacity = 0.0;

  void toggleOpacity(bool isVisibility) {
    setState(() {
      if (isVisibility) {
        _opacity = 1.0;
      } else {
        _opacity = 0.0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    widget.filterController.addListener(() {
      toggleOpacity(widget.filterController.isVisibility);
    });

    return Container(
        color: colorScheme.surface,
        child: Column(children: [
          //
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Row(
                children: [
                  Text(
                    maxLines: 1,
                    S.of(context).filter_copyright,
                    style: textTheme.labelLarge,
                  ),
                  Padding(
                      padding: EdgeInsets.only(left: 8.0),
                      child: AdvancedSwitch(
                          activeColor: colorScheme.error,
                          inactiveColor: colorScheme.secondary,
                          backgroundColor: colorScheme.onPrimary,
                          value: widget.isCopyright,
                          onChanged: widget.onChanged)),
                  Spacer(),
                  Text(
                    maxLines: 1,
                    S.of(context).filter_asc,
                    style: textTheme.labelLarge,
                  ),
                  Padding(
                      padding: EdgeInsets.only(left: 8.0),
                      child: CustomIconButton(
                          icon: SvgPicture.asset(
                            _getIcon(widget.isAsc),
                            height: 16.0,
                            width: 16.0,
                          ),
                          onPressed: widget.onPressed)),
                ],
              )),
          Padding(
              padding: EdgeInsets.only(bottom: 8),
              child: MultiSelectContainer(items: [
                MultiSelectCard(
                    textStyles: MultiSelectItemTextStyles(
                        textStyle: textTheme.bodySmall
                            ?.copyWith(color: colorScheme.primary),
                        selectedTextStyle: textTheme.bodySmall
                            ?.copyWith(color: colorScheme.surface),
                        disabledTextStyle: textTheme.bodySmall),
                    highlightColor: colorScheme.secondary,
                    value: 'en',
                    label: S.of(context).lang_en),
                MultiSelectCard(
                    textStyles: MultiSelectItemTextStyles(
                        textStyle: textTheme.bodySmall
                            ?.copyWith(color: colorScheme.primary),
                        selectedTextStyle: textTheme.bodySmall
                            ?.copyWith(color: colorScheme.surface),
                        disabledTextStyle: textTheme.bodySmall),
                    highlightColor: colorScheme.secondary,
                    value: 'fr',
                    label: S.of(context).lang_fr),
                MultiSelectCard(
                    textStyles: MultiSelectItemTextStyles(
                        textStyle: textTheme.bodySmall
                            ?.copyWith(color: colorScheme.primary),
                        selectedTextStyle: textTheme.bodySmall
                            ?.copyWith(color: colorScheme.surface),
                        disabledTextStyle: textTheme.bodySmall),
                    highlightColor: colorScheme.secondary,
                    value: 'de',
                    label: S.of(context).lang_de),
                MultiSelectCard(
                    textStyles: MultiSelectItemTextStyles(
                        textStyle: textTheme.bodySmall
                            ?.copyWith(color: colorScheme.primary),
                        selectedTextStyle: textTheme.bodySmall
                            ?.copyWith(color: colorScheme.surface),
                        disabledTextStyle: textTheme.bodySmall),
                    highlightColor: colorScheme.secondary,
                    value: 'pl',
                    label: S.of(context).lang_pl),
                MultiSelectCard(
                    textStyles: MultiSelectItemTextStyles(
                        textStyle: textTheme.bodySmall
                            ?.copyWith(color: colorScheme.primary),
                        selectedTextStyle: textTheme.bodySmall
                            ?.copyWith(color: colorScheme.surface),
                        disabledTextStyle: textTheme.bodySmall),
                    highlightColor: colorScheme.secondary,
                    value: 'es',
                    label: S.of(context).lang_es),
              ], onChange: widget.onChangeFoo)),
          AnimatedOpacity(
              opacity: _opacity,
              duration: Duration(milliseconds: 500),
              child: Container(
                height: 1,
                color: colorScheme.onSurface,
              ))
        ]));
  }

  String _getIcon(bool isAsc) {
    if (isAsc) {
      return "assets/svg/icon-arrow-up-24.svg";
    } else {
      return "assets/svg/icon-arrow-down-24.svg";
    }
  }
}
