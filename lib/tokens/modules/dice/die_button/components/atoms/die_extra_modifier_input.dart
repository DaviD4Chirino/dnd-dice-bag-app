import 'package:dice_bag/tokens/app/app_spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// A Scroll that lets you increase the amount by that many
class DieExtraModifierInput extends StatefulWidget {
  const DieExtraModifierInput({super.key, this.onChanged});

  final void Function(int amount)? onChanged;

  @override
  State<DieExtraModifierInput> createState() =>
      _DieExtraModifierInputState();
}

class _DieExtraModifierInputState
    extends State<DieExtraModifierInput> {
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    var inputDecoration = InputDecoration(
      border: InputBorder.none,
      alignLabelWithHint: true,
      contentPadding: EdgeInsets.all(AppSpacing.sm),
      isDense: true,
      hintText: "-1  0  +1",
      hintStyle: theme.textTheme.labelLarge?.copyWith(
        color: theme.colorScheme.onSurface.withAlpha(50),
      ),
    );
    return TextField(
      decoration: inputDecoration,
      inputFormatters: [
        FilteringTextInputFormatter.allow(RegExp(r'[0-9+-]')),
      ],
      onChanged: (val) {
        if (widget.onChanged != null) {
          widget.onChanged!(int.tryParse(val) ?? 0);
        }
      },
      cursorHeight: 20,
      style: theme.textTheme.labelLarge,
      textAlign: TextAlign.center,
      textAlignVertical: TextAlignVertical.center,
    );
  }
}
