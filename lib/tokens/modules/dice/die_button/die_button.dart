import 'package:dice_bag/providers/roll_history_provider.dart';
import 'package:dice_bag/tokens/app/app_sizing.dart';
import 'package:dice_bag/tokens/models/dice/die.dart';
import 'package:dice_bag/tokens/modules/dice/die_button/components/atoms/die_reset_button.dart';
import 'package:dice_bag/tokens/modules/dice/die_button/components/components/die_button_footer.dart';
import 'package:dice_bag/tokens/modules/dice/atoms/polymath.dart';
import 'package:dice_bag/tokens/modules/dice/die_result_dialog/die_result_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class DieButton extends HookConsumerWidget {
  const DieButton(this.die, {super.key, this.onPressed});
  final VoidCallback? onPressed;
  final Die die;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ThemeData theme = Theme.of(context);

    final rollHistoryNotifier = ref.watch(
      rollHistoryNotifierProvider.notifier,
    );
    var copyDie = die.copyWith();

    var extraTextController = useTextEditingController();

    var dieAmount = useState(1);
    var dieExtra = useState(0);

    var style = TextButton.styleFrom(
      padding: EdgeInsets.symmetric(
        vertical: AppSizing.lg,
        horizontal: AppSizing.lg,
      ),
      foregroundColor: theme.colorScheme.surfaceContainer,
      backgroundColor: theme.colorScheme.surfaceContainerLow,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSizing.xs),
      ),
      visualDensity: VisualDensity.compact,
    );

    var extraText = dieExtra.value != 0
        ? dieExtra.value > 0
              ? "+${dieExtra.value}"
              : "${dieExtra.value}"
        : "";
    var dieAmountText = dieAmount.value > 1
        ? dieAmount.value.toString()
        : "";
    var dieText = "$dieAmountText${copyDie.label}";

    void reset() {
      dieAmount.value = 1;
      dieExtra.value = 0;
      extraTextController.text = "";
    }

    void increaseDieAmount() {
      dieAmount.value++;
      dieAmount.value = dieAmount.value.clamp(1, 99);
    }

    void decreaseDieAmount() {
      dieAmount.value--;
      dieAmount.value = dieAmount.value.clamp(1, 99);
    }

    void setExtra(int value) {
      dieExtra.value = value;
    }

    useEffect(() {
      copyDie.amount = dieAmount.value;
      copyDie.modifier = dieExtra.value;
      return;
    }, [dieAmount.value, dieExtra.value]);

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
                  var rollData = copyDie.roll();
                  rollHistoryNotifier.registerRoll(rollData);

                  showDialog(
                    context: context,
                    builder: (context) =>
                        DieResultDialog(rollData),
                  );
                },
            style: style,
            child: Polymath.fromDie(
              dieText,
              die: copyDie,
              footerText: extraText,
              style: theme.textTheme.titleLarge,
              padding: 10,
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
                  extraInputController: extraTextController,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
