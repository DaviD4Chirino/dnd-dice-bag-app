import 'package:dice_bag/extensions/double_extensions/sized_box_extension.dart';
import 'package:dice_bag/tokens/app/app_spacing.dart';
import 'package:dice_bag/tokens/models/dice/die_roll_data.dart';
import 'package:dice_bag/tokens/modules/dice/atoms/polymath.dart';
import 'package:flutter/material.dart';

class RollHistoryEntry extends StatelessWidget {
  const RollHistoryEntry(this.rollData, {super.key});

  final DieRollData rollData;
  String get resultString => rollData.rolls.join(" | ");

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return ListTile(
      leading: Polymath.filled(
        rollData.totalValue.toString(),
        style: theme.textTheme.bodyLarge,
        padding: 5,
      ),
      title: Row(
        children: [
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Text(rollData.die.label),
            ),
          ),
          AppSpacing.sm.sizedBoxW,
          Text(
            "13/09 6:40PM",
            style: theme.textTheme.labelSmall,
          ),
        ],
      ),
      subtitle: Container(
        constraints: BoxConstraints(maxHeight: 60),
        child: SingleChildScrollView(child: Text(resultString)),
      ),
    );
  }
}
