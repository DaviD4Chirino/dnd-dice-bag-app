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
import 'package:layout/layout.dart';

class DieButton extends HookConsumerWidget {
  const DieButton(this.die, {super.key, this.onPressed});
  final VoidCallback? onPressed;
  final Die die;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ThemeData theme = Theme.of(context);

    final copyDie = die.copyWith();

    final extraTextController = useTextEditingController();

    final dieAmount = useState(1);
    final dieExtra = useState(0);

    final style = TextButton.styleFrom(
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

    final extraText = dieExtra.value != 0
        ? dieExtra.value > 0
              ? "+${dieExtra.value}"
              : "${dieExtra.value}"
        : "";
    final dieAmountText = dieAmount.value > 1
        ? dieAmount.value.toString()
        : "";
    final dieText = "$dieAmountText${copyDie.label}";

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

    return Stack(
      fit: StackFit.expand,
      children: [
        PolymathText(
          onPressed: onPressed,
          copyDie: copyDie,
          style: style,
          dieText: dieText,
          extraText: extraText,
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
    );
  }
}

class PolymathText extends ConsumerWidget {
  const PolymathText({
    super.key,
    required this.onPressed,
    required this.copyDie,
    required this.style,
    required this.dieText,
    required this.extraText,
  });

  final VoidCallback? onPressed;
  final Die copyDie;
  final ButtonStyle style;
  final String dieText;
  final String extraText;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final rollHistoryNotifier = ref.watch(
      rollHistoryNotifierProvider.notifier,
    );
    final ThemeData theme = Theme.of(context);
    return TextButton(
      onPressed:
          onPressed ??
          () {
            var rollData = copyDie.roll();
            rollHistoryNotifier.registerRoll(rollData);

            showDialog(
              context: context,
              builder: (context) => DieResultDialog(rollData),
            );
          },
      style: style,
      child: Polymath(
        dieText,
        die: copyDie,
        footerText: extraText,
        style: context.layout
            .value(
              xs: theme.textTheme.headlineSmall,
              md: theme.textTheme.headlineMedium,
            )
            ?.copyWith(fontWeight: FontWeight.bold),
        padding: 10,
      ),
    );
  }
}
