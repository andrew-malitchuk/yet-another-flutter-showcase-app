import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../../../../../generated/l10n.dart';
import '../../../../../../../core/ui/widget/button/icon/icon_button.dart';

class SearchHeaderController extends ChangeNotifier {
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

class SearchHeader extends StatefulWidget {
  final String action;
  final VoidCallback onActionPressed;
  final SearchHeaderController searchHeaderController;
  final ValueChanged<String>? onChanged;

  const SearchHeader({
    super.key,
    required this.action,
    required this.onActionPressed,
    required this.searchHeaderController,
    required this.onChanged,
  });

  @override
  State<StatefulWidget> createState() {
    return _FadeContainerState();
  }
}

class _FadeContainerState extends State<SearchHeader> {
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

    widget.searchHeaderController.addListener(() {
      toggleOpacity(widget.searchHeaderController.isVisibility);
    });

    return Container(
        color: colorScheme.surface,
        child: Column(children: [
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Row(
                children: [
                  CustomIconButton(
                    icon: SvgPicture.asset(
                      widget.action,
                      height: 16.0,
                      width: 16.0,
                      color: colorScheme.secondary,
                    ),
                    onPressed: widget.onActionPressed,
                  ),
                  SizedBox(width: 16),
                  Expanded(
                      child: TextField(
                    style: textTheme.headlineSmall
                        ?.copyWith(color: colorScheme.onPrimary),
                    onChanged: widget.onChanged,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.transparent,
                      contentPadding: EdgeInsets.all(8),
                      hintText: S.of(context).search_hint,
                      hintStyle: textTheme.headlineSmall
                          ?.copyWith(color: colorScheme.onPrimary),
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(width: 2, color: colorScheme.primary),
                        borderRadius:
                            BorderRadius.circular(16), // Corner radius
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(width: 2, color: colorScheme.secondary),
                        borderRadius:
                            BorderRadius.circular(16), // Corner radius
                      ),
                    ),
                  ))
                ],
              )),
          AnimatedOpacity(
              opacity: _opacity,
              duration: Duration(milliseconds: 500),
              child: Container(
                height: 1,
                color: colorScheme.onSurface,
              ))
        ]));
  }
}
