import 'package:dice_bag/tokens/models/dice/die_roll_data.dart';
import 'package:dice_bag/tokens/modules/dice/atoms/polymath.dart';
import 'package:dice_bag/tokens/utils/copy_to_clipboard.dart';
import 'package:flutter/material.dart';
import 'package:layout/layout.dart';

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
          Polymath(
            rollData.totalValue.toString(),
            die: rollData.die,
            style: context.layout.value(
              xs: theme.textTheme.displaySmall,
              md: theme.textTheme.displayMedium,
            ),

            padding: context.layout.value(xs: 4, md: 3),
          ),
          Text(
            rollData.rollStrings,
            textAlign: TextAlign.center,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            style: theme.textTheme.bodyMedium,
          ),
        ],
      ),
      actions: [
        FilledButton.tonalIcon(
          onPressed: () {
            copyToClipboard(
              "${rollData.die.label} = ${rollData.totalValue}",
              context: context,
            );
          },
          icon: Icon(Icons.copy_rounded),
          label: Text("Copy"),
        ),
      ],
    );
  }
}
//10D100(-30) = 572