import 'package:flutter/material.dart';

class ButtonForm extends StatelessWidget {
  const ButtonForm({
    super.key,
    required this.onpressed,
    required this.child,
    required this.borderRadius,
    this.height,
    this.color,
    this.padding,
  });
  final void Function() onpressed;
  final Widget child;
  final double? height;
  final Color? color;
  final EdgeInsets? padding;
  final BorderRadius borderRadius;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onpressed,
      child: child,
      height: height ?? 40,
      elevation: 0,
      color: color ?? Colors.orange,
      padding: padding,
      shape: RoundedRectangleBorder(borderRadius: borderRadius),
    );
  }
}
