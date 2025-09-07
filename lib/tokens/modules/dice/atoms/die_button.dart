import 'package:dice_bag/tokens/app/app_sizing.dart';
import 'package:dice_bag/tokens/models/enums/die_faces.dart';
import 'package:dice_bag/tokens/modules/dice/atoms/die_amount_modifier_button.dart';
import 'package:dice_bag/tokens/modules/dice/atoms/polymath.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class DieButton extends StatelessWidget {
  const DieButton({super.key, this.onPressed});
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    var style = TextButton.styleFrom(
      padding: EdgeInsets.symmetric(
        vertical: AppSizing.lg,
        horizontal: AppSizing.lg,
      ),
      foregroundColor: theme.colorScheme.surfaceContainerHighest,
      backgroundColor: theme.colorScheme.surfaceContainer,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSizing.xs),
      ),
      visualDensity: VisualDensity.compact,
    );
    return SizedBox(
      width: 160,
      height: 160,
      child: Stack(
        fit: StackFit.expand,
        children: [
          TextButton(
            onPressed:
                onPressed ??
                () {
                  if (kDebugMode) {
                    print("Die pressed");
                  }
                },
            style: style,
            child: Polymath.filled(
              "2D20",
              faces: DieFaces.d20,
              style: theme.textTheme.headlineMedium,
            ),
          ),
          Positioned.fill(
            child: Align(
              alignment: Alignment.bottomLeft,
              child: DieAmountModifierButton(
                increase: true,
                onPressed: null,
                alignment: Alignment.bottomLeft,
              ),
            ),
          ),
          Positioned.fill(
            child: Align(
              alignment: Alignment.bottomRight,
              child: DieAmountModifierButton(
                increase: false,
                onPressed: null,
                alignment: Alignment.bottomRight,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
