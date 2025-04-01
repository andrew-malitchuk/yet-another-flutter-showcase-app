import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../../../core/ui/widget/button/icon/icon_button.dart';

class CatalogController extends ChangeNotifier {
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

class CatalogHeader extends StatefulWidget {
  final String mainAction;
  final String additionalAction;
  final VoidCallback onMainActionPressed;
  final VoidCallback onAdditionalActionPressed;
  final CatalogController catalogController;

  const CatalogHeader({
    super.key,
    required this.mainAction,
    required this.additionalAction,
    required this.onMainActionPressed,
    required this.onAdditionalActionPressed,
    required this.catalogController,
  });

  @override
  State<StatefulWidget> createState() {
    return _FadeContainerState();
  }
}

class _FadeContainerState extends State<CatalogHeader> {
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

    widget.catalogController.addListener(() {
      toggleOpacity(widget.catalogController.isVisibility);
    });

    return Container(
        color: colorScheme.surface,
        child: Column(children: [
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Row(
                children: [
                  Spacer(),
                  CustomIconButton(
                    icon: SvgPicture.asset(
                      widget.mainAction,
                      height: 16.0,
                      width: 16.0,
                      color: colorScheme.secondary,
                    ),
                    onPressed: widget.onMainActionPressed,
                  ),
                  CustomIconButton(
                    icon: SvgPicture.asset(
                      widget.additionalAction,
                      height: 16.0,
                      width: 16.0,
                      color: colorScheme.secondary,
                    ),
                    onPressed: widget.onAdditionalActionPressed,
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
