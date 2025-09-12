import 'package:flutter/material.dart';

class DiceRollHeader extends StatelessWidget {
  const DiceRollHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Tap and start to roll",
          style: theme.textTheme.labelLarge,
        ),
        //TODO: Write instructions
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.info_outline),
          tooltip: "Instructions",
        ),
      ],
    );
  }
}
