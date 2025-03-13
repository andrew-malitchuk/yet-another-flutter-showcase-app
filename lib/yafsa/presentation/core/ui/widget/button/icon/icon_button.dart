import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomIconButton extends StatefulWidget {
  final SvgPicture icon;
  final VoidCallback onPressed;

  const CustomIconButton({
    required this.icon,
    required this.onPressed,
    super.key,
  });

  @override
  _CustomIconButtonState createState() => _CustomIconButtonState();
}

class _CustomIconButtonState extends State<CustomIconButton> {
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

    return GestureDetector(
      onTapDown: _onTapDown,
      onTapUp: _onTapUp,
      onTapCancel: _onTapCancel,
      child: AnimatedContainer(
          duration: Duration(milliseconds: 500),
          padding: EdgeInsets.all(_isPressed ? 16.0 : 16.0),
          decoration: BoxDecoration(
            color: _isPressed ? colorScheme.primary : colorScheme.surface,
            shape: BoxShape.circle,
          ),
          child: widget.icon),
    );
  }
}
