import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/ui/widget/button/icon/icon_button.dart';

class DetalizationController extends ChangeNotifier {
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

class DetalizationHeader extends StatefulWidget {
  final String title;
  final bool isSelected;
  final VoidCallback onNavigationPressed;
  final VoidCallback onFavouritePressed;

  final DetalizationController detalizationController;

  const DetalizationHeader({
    super.key,
    required this.title,
    required this.isSelected,
    required this.onNavigationPressed,
    required this.onFavouritePressed,
    required this.detalizationController,
  });

  @override
  State<StatefulWidget> createState() {
    return _FadeContainerState();
  }
}

class _FadeContainerState extends State<DetalizationHeader> {
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

    widget.detalizationController.addListener(() {
      toggleOpacity(widget.detalizationController.isVisibility);
    });

    String? favIcon = "assets/svg/icon-favorite-default-24.svg";
    if (widget.isSelected) {
      favIcon = "assets/svg/icon-favorite-filled-24.svg";
    } else {
      favIcon = "assets/svg/icon-favorite-default-24.svg";
    }

    return Container(
        color: colorScheme.surface,
        child: Column(children: [
          Padding(
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
                    onPressed: widget.onNavigationPressed,
                  ),
                  Expanded(
                      child: Center(
                          child: Padding(
                              padding: EdgeInsets.only(right: 24.0),
                              child: Text(widget.title,
                                  style: textTheme.bodyLarge?.copyWith(
                                      color: colorScheme.onPrimary))))),
                  CustomIconButton(
                    icon: SvgPicture.asset(
                      favIcon,
                      height: 16.0,
                      width: 16.0,
                      color: colorScheme.onPrimary,
                    ),
                    onPressed: widget.onFavouritePressed,
                  ),
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
