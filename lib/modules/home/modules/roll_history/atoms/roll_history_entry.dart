import 'package:dart_date/dart_date.dart';
import 'package:dice_bag/extensions/double_extensions/sized_box_extension.dart';
import 'package:dice_bag/i18n/gen/strings.g.dart';
import 'package:dice_bag/tokens/app/app_sizing.dart';
import 'package:dice_bag/tokens/app/app_spacing.dart';
import 'package:dice_bag/tokens/models/dice/die_roll_data.dart';
import 'package:dice_bag/tokens/modules/dice/atoms/polymath.dart';
import 'package:dice_bag/tokens/modules/dice/die_result_dialog/die_result_dialog.dart';
import 'package:flutter/material.dart';

class RollHistoryEntry extends StatelessWidget {
  const RollHistoryEntry(this.rollData, {super.key});

  final DieRollData rollData;

  @override
  Widget build(BuildContext context) {
    AppLocale appLocale = AppLocaleUtils.findDeviceLocale();
    var rollDate = rollData.date.timeago(
      clock: DateTime.now(),
      locale: appLocale.languageCode,
    );

    final ThemeData theme = Theme.of(context);
    return ListTile(
      onTap: () {
        showDialog(
          context: context,
          builder: (context) => DieResultDialog(rollData),
        );
      },
      contentPadding: EdgeInsets.symmetric(
        vertical: AppSpacing.lg,
        horizontal: AppSpacing.md,
      ),
      leading: Polymath(
        rollData.totalValue.toString(),
        die: rollData.die,
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
          Text(rollDate, style: theme.textTheme.labelSmall),
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
