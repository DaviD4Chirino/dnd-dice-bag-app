import 'package:dice_bag/tokens/app/app_sizing.dart';
import 'package:dice_bag/tokens/modules/dice/atoms/polymath.dart';
import 'package:flutter/material.dart';

class DieCard extends StatelessWidget {
  const DieCard({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Container(
      width: 150,
      height: 150,
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceContainer,
        borderRadius: BorderRadius.circular(AppSizing.xs),
      ),
      child: Polymath.filled(
        "54",
        faces: 6,
        style: theme.textTheme.displayMedium,
      ),
    );
  }
}
