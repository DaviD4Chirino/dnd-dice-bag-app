import 'package:dice_bag/i18n/gen/strings.g.dart';
import 'package:flutter/material.dart';

class DiceRollHeader extends StatelessWidget {
  const DiceRollHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final t = strings.modules.home.pages.diceRollPage;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(t.info, style: theme.textTheme.labelLarge),
        //TODO: Write instructions
        // IconButton(
        //   onPressed: () {},
        //   icon: Icon(Icons.info_outline),
        //   tooltip: "Instructions",
        // ),
      ],
    );
  }
}
