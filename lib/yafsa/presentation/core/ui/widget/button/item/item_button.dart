import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomItemButton extends StatefulWidget {
  final String icon;
  final String title;
  final VoidCallback onPressed;

  const CustomItemButton({
    required this.icon,
    required this.title,
    required this.onPressed,
    super.key,
  });

  @override
  _CustomItemButtonState createState() => _CustomItemButtonState();
}

class _CustomItemButtonState extends State<CustomItemButton> {
  bool _isPressed = false;

  void _onTapDown(TapDownDetails details) {
    setState(() {
      _isPressed = true;
    });
  }

  void _onTapUp(TapUpDetails details) {
    setState(() {
      _isPressed = false;
    });
    widget.onPressed();
  }

  void _onTapCancel() {
    setState(() {
      _isPressed = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    return GestureDetector(
        onTapDown: _onTapDown,
        onTapUp: _onTapUp,
        onTapCancel: _onTapCancel,
        child: AnimatedContainer(
          duration: Duration(milliseconds: 500),
          padding: EdgeInsets.all(_isPressed ? 16.0 : 16.0),
          decoration: BoxDecoration(
            color: _isPressed ? colorScheme.primary : colorScheme.surface,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(64.0),
          ),
          child: Padding(
              padding: EdgeInsets.all(8),
              child: Row(children: [
                SvgPicture.asset(widget.icon,
                    height: 32.0,
                    width: 43.0,
                    color:
                        _isPressed ? colorScheme.surface : colorScheme.primary),
                Padding(padding: EdgeInsets.only(left: 16)),
                Text(
                  widget.title,
                  textAlign: TextAlign.start,
                  style: textTheme.headlineSmall?.copyWith(
                      color: _isPressed
                          ? colorScheme.surface
                          : colorScheme.onPrimary),
                ),
              ])),
        ));
  }
}
