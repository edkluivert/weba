import 'package:flutter/material.dart';
import 'package:weba/constants/colors.dart';

class HoverText extends StatefulWidget {
  final String text;
  final TextStyle? style;
  final Color hoverColor;

  const HoverText(
    this.text, {
    super.key,
    this.style,
    this.hoverColor = AppColors.secondary,
  });

  @override
  State<HoverText> createState() => _HoverTextState();
}

class _HoverTextState extends State<HoverText> {
  bool _isHovering = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovering = true),
      onExit: (_) => setState(() => _isHovering = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {}, // Make it clickable (placeholder)
        child: AnimatedDefaultTextStyle(
          duration: const Duration(milliseconds: 200),
          style: (widget.style ?? const TextStyle()).copyWith(
            color: _isHovering ? widget.hoverColor : widget.style?.color,
          ),
          child: Text(widget.text),
        ),
      ),
    );
  }
}
