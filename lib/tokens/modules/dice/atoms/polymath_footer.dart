import 'package:flutter/material.dart';
import 'package:outlined_text/outlined_text.dart';

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
    return OutlinedText(
      text: Text(
        text!,
        style: theme.textTheme.labelMedium?.copyWith(
          color: color,
          fontWeight: FontWeight.bold,
        ),
        textAlign: TextAlign.center,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,

        // strokeColor: reversedColor,
        // strokeWidth: 3.5,
      ),
      strokes: [
        OutlinedTextStroke(color: reversedColor, width: 3),
      ],
    );
  }
}
