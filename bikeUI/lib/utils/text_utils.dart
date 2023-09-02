import 'package:flutter/material.dart';

class TextUtil extends StatelessWidget {
  final String text;
  final Color? color;
  final double? size;
  final bool? weight;
  const TextUtil(
      {super.key, required this.text, this.color, this.size, this.weight});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          color: color ?? Colors.white,
          fontSize: size ?? 20,
          fontWeight: weight == null ? FontWeight.normal : FontWeight.bold),
    );
  }
}
