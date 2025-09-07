import 'package:dice_bag/tokens/app/app_sizing.dart';
import 'package:dice_bag/tokens/models/enums/die_faces.dart';
import 'package:dice_bag/tokens/modules/dice/die_button/components/atoms/die_reset_button.dart';
import 'package:dice_bag/tokens/modules/dice/die_button/components/components/die_button_footer.dart';
import 'package:dice_bag/tokens/modules/dice/atoms/polymath.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class DieButton extends HookWidget {
  const DieButton({super.key, this.onPressed});
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    var dieAmount = useState(1);
    var dieExtra = useState(0);

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

    void reset() {
      dieAmount.value = 1;
      dieExtra.value = 0;
      dieExtra.value = 0;
    }

    void increaseDieAmount() {
      dieAmount.value++;
      dieAmount.value = dieAmount.value.clamp(0, 99);
    }

    void decreaseDieAmount() {
      dieAmount.value--;
      dieAmount.value = dieAmount.value.clamp(0, 99);
    }

    void setExtra(int value) {
      dieExtra.value = value;
    }

    var extraText = dieExtra.value != 0
        ? dieExtra.value > 0
              ? "(+${dieExtra.value})"
              : "(${dieExtra.value})"
        : "";
    var dieAmountText = dieAmount.value > 1
        ? dieAmount.value.toString()
        : "";
    var diceFaces = DieFaces.d20;
    var dieText =
        "$dieAmountText${diceFaces.name.toUpperCase()}$extraText";

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
              dieText,
              faces: DieFaces.d20,
              style: theme.textTheme.headlineMedium,
            ),
          ),
          Positioned.fill(
            child: Align(
              alignment: Alignment.topRight,
              child: DieResetButton(onPressed: reset),
            ),
          ),

          Positioned.fill(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                height: AppSizing.md,
                child: DieButtonFooter(
                  onMinusPressed: decreaseDieAmount,
                  onPlusPressed: increaseDieAmount,
                  onExtraInputChanged: setExtra,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
