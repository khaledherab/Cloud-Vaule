import 'package:flutter/material.dart';

class TextForm extends StatelessWidget {
  final String text;
  final Color? color;
  final TextAlign? align;
  final double? size;
  final FontWeight? fontweight;

  const TextForm({
    super.key,
    required this.text,
    this.color,
    this.align,
    this.size,
    this.fontweight,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      textAlign: align,
      text,
      style: TextStyle(
        fontWeight: fontweight ?? FontWeight.normal,
        fontSize: size ?? 18,
        color: color ?? Colors.black,
      ),
    );
  }
}
