import 'package:dice_bag/tokens/modules/dice/die_button/components/atoms/die_amount_modifier_button.dart';
import 'package:dice_bag/tokens/modules/dice/die_button/components/atoms/die_extra_modifier_input.dart';
import 'package:flutter/material.dart';

class DieButtonFooter extends StatelessWidget {
  const DieButtonFooter({
    super.key,
    this.onMinusPressed,
    this.onPlusPressed,
    this.onExtraInputChanged,
    this.extraInputController,
  });
  final TextEditingController? extraInputController;

  final void Function()? onPlusPressed;
  final void Function()? onMinusPressed;
  final void Function(int)? onExtraInputChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,

      children: [
        Expanded(
          child: DieAmountModifierButton(
            increase: false,
            onPressed: onMinusPressed,
            alignment: Alignment.bottomLeft,
          ),
        ),
        Expanded(
          flex: 2,
          child: DieExtraModifierInput(
            onChanged: onExtraInputChanged,
            controller: extraInputController,
          ),
        ),
        Expanded(
          child: DieAmountModifierButton(
            increase: true,
            onPressed: onPlusPressed,
            alignment: Alignment.bottomRight,
          ),
        ),
      ],
    );
  }
}
