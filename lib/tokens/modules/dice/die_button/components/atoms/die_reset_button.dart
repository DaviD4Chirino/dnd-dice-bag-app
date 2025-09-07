import 'package:dice_bag/tokens/app/app_sizing.dart';
import 'package:flutter/material.dart';

class DieResetButton extends StatelessWidget {
  const DieResetButton({super.key, required this.onPressed});

  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: Icon(Icons.restart_alt_rounded),
      style: ButtonStyle(
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSizing.xs),
          ),
        ),
      ),
    );
  }
}
