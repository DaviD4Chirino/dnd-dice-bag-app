import 'dart:math';

import 'package:dice_bag/tokens/modules/dice/atoms/polymath.dart';
import 'package:flutter/material.dart';

class DieResultDialog extends StatelessWidget {
  const DieResultDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final results = List.generate(
      2,
      (index) => "${Random().nextInt(100)}",
    );
    final resultString = results.join(" | ");

    return AlertDialog(
      title: Text(
        "99D20(+323584621512312312321)",
        textAlign: TextAlign.center,
        overflow: TextOverflow.ellipsis,
        maxLines: 1,
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Polymath.filled(
            "99999999999999",
            style: theme.textTheme.headlineLarge,
            padding: 5,
          ),
          if (results.length > 1)
            Text(
              resultString,
              textAlign: TextAlign.center,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
        ],
      ),
      actions: [
        FilledButton.tonalIcon(
          onPressed: () {},
          icon: Icon(Icons.copy_rounded),
          label: Text("Copy"),
        ),
      ],
    );
  }
}
