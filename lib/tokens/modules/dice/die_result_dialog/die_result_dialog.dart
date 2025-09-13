import 'package:dice_bag/tokens/models/dice/die_roll_data.dart';
import 'package:dice_bag/tokens/modules/dice/atoms/polymath.dart';
import 'package:flutter/material.dart';

class DieResultDialog extends StatelessWidget {
  const DieResultDialog(this.rollData, {super.key});

  final DieRollData rollData;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return AlertDialog(
      title: Text(
        rollData.die.label,
        textAlign: TextAlign.center,
        overflow: TextOverflow.ellipsis,
        maxLines: 1,
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Polymath.filled(
            rollData.totalValue.toString(),
            style: theme.textTheme.headlineLarge,
            padding: 5,
            faces: rollData.die.faces,
          ),
          if (rollData.rolls.length > 1)
            Text(
              rollData.rollStrings,
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
