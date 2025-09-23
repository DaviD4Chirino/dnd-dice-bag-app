import 'package:dice_bag/i18n/gen/strings.g.dart';
import 'package:dice_bag/providers/roll_history_provider.dart';
import 'package:dice_bag/tokens/models/dice/die_roll_data.dart';
import 'package:dice_bag/tokens/modules/dice/atoms/polymath.dart';
import 'package:dice_bag/tokens/utils/copy_to_clipboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:layout/layout.dart';

class DieResultDialog extends HookConsumerWidget {
  const DieResultDialog(this.rollData, {super.key});

  final DieRollData rollData;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ThemeData theme = Theme.of(context);
    final t = strings.modules.rollResultDialog;
    final globalKeyValue = useState(0);
    final rerolling = useState(false);
    final ValueNotifier<DieRollData?> reRollData = useState(
      null,
    );
    final tCopyToClipboard = strings.utils.copyToClipboard;
    final rollHistoryNotifier = ref.watch(
      rollHistoryNotifierProvider.notifier,
    );

    var currentRollData = reRollData.value ?? rollData;

    void reRoll() {
      rerolling.value = true;
      reRollData.value = rollData.die.roll();
      rollHistoryNotifier.registerRoll(reRollData.value!);
      globalKeyValue.value++;
    }

    // final timer = useAnimatedNumber(
    //   finalValue: rollData.totalValue,
    //   duration: rollAnimDuration(),
    // );

    return AlertDialog(
      key: ValueKey(globalKeyValue.value),
      titleTextStyle: context.layout.value(
        xs: theme.textTheme.headlineSmall,
        md: theme.textTheme.headlineMedium,
        lg: theme.textTheme.headlineLarge,
      ),

      title: Text(
        currentRollData.die.label,
        textAlign: TextAlign.center,
        overflow: TextOverflow.ellipsis,
        maxLines: 1,
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Polymath(
            currentRollData.totalValue.toString(),
            // timer.toString(),
            die: currentRollData.die,
            style: context.layout.value(
              xs: theme.textTheme.displaySmall,
              md: theme.textTheme.displayMedium,
              lg: theme.textTheme.displayLarge,
            ),
            padding: context.layout.value(xs: 5, lg: 6),
            animate: true,
          ),
          Container(
            constraints: BoxConstraints(
              maxWidth: context.layout.value(
                xs: 300,
                md: 450,
                lg: 600,
              ),
            ),
            child: Text(
              currentRollData.rollStrings,
              textAlign: TextAlign.center,
              maxLines: 5,
              overflow: TextOverflow.ellipsis,
              style: context.layout.value(
                xs: theme.textTheme.bodyMedium,
                lg: theme.textTheme.bodyLarge,
              ),
            ),
          ),
        ],
      ),
      actions: [
        IconButton(
          icon: Icon(Icons.refresh),
          onPressed: reRoll,
          tooltip: t.reroll,
        ),
        FilledButton.tonalIcon(
          onPressed: () {
            // 2D20(+2) = 16
            copyToClipboard(
              "${currentRollData.die.label} = ${currentRollData.totalValue}",
              context: context,
            );
          },
          icon: Icon(Icons.copy_rounded),
          label: Text(tCopyToClipboard.buttonLabelShort),
        ),
      ],
    );
  }
}
//10D100(-30) = 572