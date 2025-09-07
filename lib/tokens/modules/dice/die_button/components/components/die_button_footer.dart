import 'package:dice_bag/tokens/modules/dice/die_button/components/atoms/die_amount_modifier_button.dart';
import 'package:dice_bag/tokens/modules/dice/die_button/components/atoms/die_extra_modifier_input.dart';
import 'package:flutter/material.dart';

class DieButtonFooter extends StatelessWidget {
  const DieButtonFooter({
    super.key,
    this.onMinusPressed,
    this.onPlusPressed,
    this.onExtraInputChanged,
  });
  final void Function()? onPlusPressed;
  final void Function()? onMinusPressed;
  final void Function(int)? onExtraInputChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        DieAmountModifierButton(
          increase: false,
          onPressed: onMinusPressed,
          alignment: Alignment.bottomLeft,
        ),
        Expanded(
          child: DieExtraModifierInput(
            onChanged: onExtraInputChanged,
          ),
        ),
        DieAmountModifierButton(
          increase: true,
          onPressed: onPlusPressed,
          alignment: Alignment.bottomRight,
        ),
      ],
    );
  }
}
