import 'package:dice_bag/tokens/app/app_sizing.dart';
import 'package:dice_bag/tokens/app/app_spacing.dart';
import 'package:flutter/material.dart';

class DieAmountModifierButton extends StatelessWidget {
  const DieAmountModifierButton({
    super.key,
    required this.onPressed,
    required this.alignment,
    required this.increase,
  });

  final VoidCallback? onPressed;
  final Alignment alignment;
  final bool increase;

  @override
  Widget build(BuildContext context) {
    var borderRadius = BorderRadius.only(
      topLeft: alignment == Alignment.topLeft
          ? Radius.circular(AppSizing.xs)
          : Radius.zero,
      topRight: alignment == Alignment.topRight
          ? Radius.circular(AppSizing.xs)
          : Radius.zero,
      bottomLeft: alignment == Alignment.bottomLeft
          ? Radius.circular(AppSizing.xs)
          : Radius.zero,
      bottomRight: alignment == Alignment.bottomRight
          ? Radius.circular(AppSizing.xs)
          : Radius.zero,
    );

    return IconButton.filled(
      style: ButtonStyle(
        padding: WidgetStateProperty.all(
          EdgeInsets.all(AppSpacing.xs),
        ),
        minimumSize: WidgetStateProperty.all(const Size(0, 0)),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(borderRadius: borderRadius),
        ),
        maximumSize: WidgetStateProperty.all(
          const Size(double.infinity, 0),
        ),
      ),
      onPressed: onPressed,
      icon: Icon(increase ? Icons.add : Icons.remove),
    );
  }
}
