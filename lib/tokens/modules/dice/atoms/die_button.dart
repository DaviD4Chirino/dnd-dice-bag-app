import 'package:dice_bag/tokens/app/app_sizing.dart';
import 'package:dice_bag/tokens/models/enums/die_faces.dart';
import 'package:dice_bag/tokens/modules/dice/atoms/polymath.dart';
import 'package:flutter/material.dart';

class DieButton extends StatelessWidget {
  const DieButton({super.key, this.onPressed});
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        padding: EdgeInsets.symmetric(
          vertical: AppSizing.xs,
          horizontal: AppSizing.sm,
        ),
        foregroundColor:
            theme.colorScheme.surfaceContainerHighest,
        backgroundColor: theme.colorScheme.surfaceContainer,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSizing.xs),
        ),
        visualDensity: VisualDensity.compact,
      ),
      child: Polymath(
        "54",
        faces: DieFaces.d20,
        style: theme.textTheme.displaySmall,
      ),
    );
  }
}
