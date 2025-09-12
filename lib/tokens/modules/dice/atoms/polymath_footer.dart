import 'package:flutter/material.dart';
import 'package:stroke_text/stroke_text.dart';

class PolymathFooter extends StatelessWidget {
  const PolymathFooter({
    super.key,
    required this.text,
    required this.color,
    required this.reversedColor,
  });

  final String? text;
  final Color color;
  final Color reversedColor;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return StrokeText(
      text: text!,
      textStyle: theme.textTheme.labelSmall?.copyWith(
        color: color,
        fontWeight: FontWeight.bold,
      ),
      strokeColor: reversedColor,
      textAlign: TextAlign.center,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }
}
