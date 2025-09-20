import 'package:dice_bag/extensions/double_extensions/sized_box_extension.dart';
import 'package:dice_bag/tokens/app/app_sizing.dart';
import 'package:dice_bag/tokens/app/app_spacing.dart';
import 'package:dice_bag/tokens/models/dice/die_roll_data.dart';
import 'package:dice_bag/tokens/modules/dice/atoms/polymath.dart';
import 'package:dice_bag/tokens/modules/dice/die_result_dialog/die_result_dialog.dart';
import 'package:dice_bag/tokens/utils/time_ago.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:layout/layout.dart';

class RollHistoryEntry extends StatelessWidget {
  const RollHistoryEntry(this.rollData, {super.key});

  final DieRollData rollData;

  @override
  Widget build(BuildContext context) {
    final rollDate = timeAgo(rollData.date).capitalize;
    final ThemeData theme = Theme.of(context);
    return ListTile(
      onTap: () {
        showDialog(
          context: context,
          builder: (context) => DieResultDialog(rollData),
        );
      },
      contentPadding: EdgeInsets.symmetric(
        vertical: AppSpacing.xl,
        horizontal: AppSpacing.md,
      ),
      leading: Polymath(
        rollData.totalValue.toString(),
        die: rollData.die,
        style: context.layout.value(
          xs: theme.textTheme.bodySmall,
          md: theme.textTheme.bodyMedium,
          lg: theme.textTheme.bodyLarge,
        ),
        padding: context.layout.value(xs: 5, md: 6, lg: 7),
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
            rollDate,
            style: context.layout.value(
              xs: theme.textTheme.labelSmall,
              md: theme.textTheme.labelMedium,
              lg: theme.textTheme.labelLarge,
            ),
          ),
        ],
      ),
      subtitle: Container(
        constraints: BoxConstraints(maxHeight: AppSizing.lg),
        child: SingleChildScrollView(
          child: Text(rollData.rollStrings),
        ),
      ),
    );
  }
}
