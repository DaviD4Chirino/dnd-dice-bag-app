import 'package:dice_bag/extensions/double_extensions/sized_box_extension.dart';
import 'package:dice_bag/modules/home/modules/dice_roll/molecules/dice_roll_header.dart';
import 'package:dice_bag/providers/dice_bag_provider.dart';
import 'package:dice_bag/tokens/app/app_sizing.dart';
import 'package:dice_bag/tokens/app/app_spacing.dart';
import 'package:dice_bag/tokens/modules/dice/die_button/die_button.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:layout/layout.dart';

class DiceRollPage extends ConsumerWidget {
  const DiceRollPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final diceSet = ref
        .watch(diceBagNotifierProvider)
        .first
        .copyWith();

    var diceList = diceSet.dice
        .map((die) => DieButton(die, onPressed: null))
        .toList();
    return Scaffold(
      body: Center(
        child: Container(
          constraints: BoxConstraints(maxWidth: 1440),
          alignment: Alignment.topCenter,
          child: Padding(
            padding: EdgeInsets.only(
              top: AppSizing.md,
              left: AppSpacing.lg,
              right: AppSpacing.lg,
            ),
            child: /* LayoutGrid(
              columnSizes: [0.1.fr, 1.fr],
              rowSizes:
                  context.breakpoint > LayoutBreakpoint.md
                  ? [0.1.fr]
                  : [0.1.fr, 1.fr],
              children: [DiceRollHeader()],
            ), */ Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                DiceRollHeader(),
                AppSpacing.lg.sizedBoxH,
                Expanded(
                  child: GridView.count(
                    crossAxisCount: context.layout.value(
                      xs: 2,
                      sm: 3,
                      md: 4,
                      lg: 5,
                      xl: 6,
                    ),
                    childAspectRatio: 1,
                    mainAxisSpacing: AppSpacing.xl,
                    crossAxisSpacing: AppSpacing.xl,

                    children: diceList,
                  ),
                ),
                /* FlexibleWrap(
                  isOneRowExpanded: true,
                  spacing: AppSizing.xs,
                  runSpacing: AppSizing.xs,
                  children: diceList,
                ), */
              ],
            ),
          ),
        ),
      ),
    );
  }
}
