import 'package:flutter/material.dart';

class BasicButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Widget child;
  final double? width;
  final double? height;
  final Color? color;
  final double? elevation;
  final BorderRadius? borderRadius;
  final EdgeInsetsGeometry? padding;

  const BasicButton({
    super.key,
    required this.onPressed,
    this.width,
    this.height,
    this.color,
    this.elevation,
    required this.child,
    this.borderRadius,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPressed,
      constraints: BoxConstraints(
        minWidth: width ?? double.infinity,
        minHeight: height ?? 60,
      ),
      fillColor: color,
      elevation: elevation ?? 6,
      shape: RoundedRectangleBorder(
        borderRadius:
            borderRadius ?? const BorderRadius.all(Radius.circular(14)),
      ),
      child: Padding(
        padding: padding ?? const EdgeInsets.symmetric(horizontal: 24),
        child: child,
      ),
    );
  }
}
