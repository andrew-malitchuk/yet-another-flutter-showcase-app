import 'dart:math' as Math;

import 'package:flutter/material.dart';

class AdvancedSwitch extends StatefulWidget {
  const AdvancedSwitch({
    super.key,
    required this.value,
    this.activeColor = Colors.green,
    this.inactiveColor = Colors.grey,
    this.backgroundColor = Colors.grey,
    this.borderRadius = const BorderRadius.all(Radius.circular(15)),
    this.width = 50.0,
    this.height = 30.0,
    required this.onChanged,
  });

  /// Determines current state.
  final bool value;

  /// Determines background color for the active state.
  final Color activeColor;

  /// Determines background color for the inactive state.
  final Color inactiveColor;

  final Color backgroundColor;

  /// Determines border radius.
  final BorderRadius borderRadius;

  /// Determines width.
  final double width;

  /// Determines height.
  final double height;

  /// Called on interaction.
  final ValueChanged<bool> onChanged;

  @override
  _AdvancedSwitchState createState() => _AdvancedSwitchState();
}

class _AdvancedSwitchState extends State<AdvancedSwitch>
    with SingleTickerProviderStateMixin {
  final _duration = Duration(milliseconds: 250);
  late AnimationController _animationController;
  late Animation<Color?> _colorAnimation;
  late Animation<Alignment> _slideAnimation;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: _duration,
      value: widget.value ? 1.0 : 0.0,
    );

    _slideAnimation = AlignmentTween(
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
    ).animate(_animationController);

    _colorAnimation = ColorTween(
      begin: widget.inactiveColor,
      end: widget.activeColor,
    ).animate(_animationController);

    super.initState();
  }

  @override
  void didUpdateWidget(AdvancedSwitch oldWidget) {
    if (oldWidget.value == widget.value) {
      return super.didUpdateWidget(oldWidget);
    }

    if (widget.value) {
      _animationController.forward();
    } else {
      _animationController.reverse();
    }

    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () =>
          widget.onChanged != null ? widget.onChanged(!widget.value) : null,
      child: Opacity(
        opacity: widget.onChanged != null ? 1.0 : 0.5,
        child: AnimatedBuilder(
          animation: _animationController,
          builder: (_, child) {
            return Container(
              width: widget.width,
              height: widget.height,
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                borderRadius: widget.borderRadius,
                color: _colorAnimation.value,
              ),
              child: child,
            );
          },
          child: AnimatedBuilder(
            animation: _animationController,
            builder: (context, child) {
              return Stack(
                children: [
                  Align(
                    alignment: _slideAnimation.value,
                    child: child,
                  ),
                ],
              );
            },
            child: _buildThumb(widget.backgroundColor),
          ),
        ),
      ),
    );
  }

  Widget _buildThumb(Color backgroundColor) {
    final size = Math.min(widget.width, widget.height) - 4;

    return Container(
      width: size,
      height: size,
      margin: const EdgeInsets.all(2.0),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(size / 2),
      ),
    );
  }
}
