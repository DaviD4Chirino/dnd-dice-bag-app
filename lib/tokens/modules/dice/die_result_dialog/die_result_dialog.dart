import 'package:dice_bag/tokens/models/dice/die.dart';
import 'package:dice_bag/tokens/modules/dice/atoms/polymath.dart';
import 'package:flutter/material.dart';

class DieResultDialog extends StatelessWidget {
  const DieResultDialog(this.die, {super.key});

  final Die die;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    final results = die.roll();
    final total = results.removeAt(0);
    final resultString = results.join(" | ");

    return AlertDialog(
      title: Text(
        die.label,
        textAlign: TextAlign.center,
        overflow: TextOverflow.ellipsis,
        maxLines: 1,
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Polymath.filled(
            total.toString(),
            style: theme.textTheme.headlineLarge,
            padding: 5,
            faces: die.faces,
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
