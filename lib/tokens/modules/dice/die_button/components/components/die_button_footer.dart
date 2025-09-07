import 'package:dice_bag/tokens/modules/dice/die_button/components/atoms/die_amount_modifier_button.dart';
import 'package:dice_bag/tokens/modules/dice/die_button/components/atoms/die_extra_modifier_input.dart';
import 'package:flutter/material.dart';

class DieButtonFooter extends StatelessWidget {
  const DieButtonFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        DieAmountModifierButton(
          increase: true,
          onPressed: null,
          alignment: Alignment.bottomLeft,
        ),
        Expanded(child: DieExtraModifierInput()),
        DieAmountModifierButton(
          increase: false,
          onPressed: null,
          alignment: Alignment.bottomRight,
        ),
      ],
    );
  }
}
