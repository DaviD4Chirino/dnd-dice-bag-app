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
      titleTextStyle: context.layout.value(
        xs: theme.textTheme.headlineSmall,
        md: theme.textTheme.headlineMedium,
        lg: theme.textTheme.headlineLarge,
      ),
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
              lg: theme.textTheme.displayLarge,
            ),

            padding: context.layout.value(xs: 5, lg: 6),
          ),
          Container(
            constraints: BoxConstraints(
              maxWidth: context.layout.value(
                xs: 300,
                md: 450,
                lg: 600,
              ),
            ),
            child: Text(
              rollData.rollStrings,
              textAlign: TextAlign.center,
              maxLines: 5,
              overflow: TextOverflow.ellipsis,
              style: context.layout.value(
                xs: theme.textTheme.bodyMedium,
                lg: theme.textTheme.bodyLarge,
              ),
            ),
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