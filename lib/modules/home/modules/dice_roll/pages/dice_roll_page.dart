import 'package:dice_bag/extensions/double_extensions/sized_box_extension.dart';
import 'package:dice_bag/modules/home/modules/dice_roll/molecules/dice_roll_header.dart';
import 'package:dice_bag/tokens/app/app_sizing.dart';
import 'package:dice_bag/tokens/app/app_spacing.dart';
import 'package:dice_bag/tokens/models/dice/dice_bag.dart';
import 'package:dice_bag/tokens/models/dice/die.dart';
import 'package:dice_bag/tokens/modules/dice/die_button/die_button.dart';
import 'package:flexible_wrap/flexible_wrap.dart';
import 'package:flutter/material.dart';

class DiceRollPage extends StatelessWidget {
  const DiceRollPage({super.key});

  @override
  Widget build(BuildContext context) {
    final diceBag = DiceBag(
      label: "Generated Dice Bag",
      dice: [
        Die(faces: 4),
        Die(faces: 6),
        Die(faces: 8),
        Die(faces: 10),
        Die(faces: 12),
        Die(faces: 20),
      ],
    );
    return Scaffold(
      body: Center(
        child: Container(
          constraints: BoxConstraints(maxWidth: 1024),
          alignment: Alignment.topCenter,
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(
                top: AppSizing.xs,
                left: AppSizing.sm,
                right: AppSizing.sm,
                bottom: AppSizing.lg,
              ),
              child: Column(
                children: [
                  DiceRollHeader(),
                  AppSpacing.lg.sizedBoxH,
                  FlexibleWrap(
                    spacing: AppSizing.xs,
                    runSpacing: AppSizing.xs,
                    children: diceBag.dice
                        .map(
                          (die) =>
                              DieButton(die, onPressed: null),
                        )
                        .toList(),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
