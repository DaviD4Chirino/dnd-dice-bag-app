import 'package:dice_bag/tokens/app/app_spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:layout/layout.dart';

/// A Scroll that lets you increase the amount by that many
class DieExtraModifierInput extends StatefulWidget {
  const DieExtraModifierInput({
    super.key,
    this.onChanged,
    this.controller,
  });

  final void Function(int amount)? onChanged;
  final TextEditingController? controller;

  @override
  State<DieExtraModifierInput> createState() =>
      _DieExtraModifierInputState();
}

class _DieExtraModifierInputState
    extends State<DieExtraModifierInput> {
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    var contextTextStyle = context.layout.value(
      xs: theme.textTheme.labelMedium,
      sm: theme.textTheme.bodyMedium,
      md: theme.textTheme.bodyLarge,
      lg: theme.textTheme.titleMedium,
    );
    var inputDecoration = InputDecoration(
      border: InputBorder.none,
      alignLabelWithHint: true,
      contentPadding: EdgeInsets.all(AppSpacing.sm),

      isDense: true,
      hintText: "-1  0  +1",
      hintStyle: contextTextStyle?.copyWith(
        color: theme.colorScheme.onSurface.withAlpha(50),
      ),
    );
    return TextField(
      decoration: inputDecoration,

      inputFormatters: [
        FilteringTextInputFormatter.allow(RegExp(r'[0-9+-]')),
        LengthLimitingTextInputFormatter(5),
      ],
      keyboardType: TextInputType.number,
      onChanged: (val) {
        if (widget.onChanged != null) {
          widget.onChanged!(int.tryParse(val) ?? 0);
        }
      },
      onTapOutside: (event) {
        FocusManager.instance.primaryFocus?.unfocus();
      },

      cursorHeight: 20,
      style: contextTextStyle,
      textAlign: TextAlign.center,
      textAlignVertical: TextAlignVertical.center,
      controller: widget.controller,
    );
  }
}
