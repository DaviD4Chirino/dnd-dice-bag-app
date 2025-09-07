import 'package:dice_bag/tokens/modules/dice/atoms/polymath.dart';
import 'package:flutter/material.dart';

class DieResultDialog extends StatelessWidget {
  const DieResultDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return SimpleDialog(
      title: Text("2D20(+3)"),
      children: [
        Polymath.filled(
          "9999",
          style: theme.textTheme.bodyLarge,
          padding: 8,
        ),
      ],
    );
  }
}
