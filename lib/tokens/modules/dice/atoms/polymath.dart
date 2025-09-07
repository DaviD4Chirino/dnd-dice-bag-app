import 'package:dice_bag/tokens/app/app_spacing.dart';
import 'package:dice_bag/tokens/mixins/consumer_mixin.dart';
import 'package:dice_bag/tokens/models/enums/die_faces.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// A brute-force adaptation of the Polymath font since the
/// font has limitations, such as being only white
/// and having up to 99 numbers available for any die.
///
/// You can configure this widget by use of the [style],
/// [padding] and [faces] parameters.
///
/// The [style] parameter is not only for the font style but
/// the style of the die itself. Pass a [FontWeight.bold]
/// to display a filled die
class Polymath extends ConsumerWidget with ConsumerMixin {
  const Polymath(
    this.text, {
    super.key,
    this.faces = DieFaces.d4,
    this.style,
    this.padding = 3.5,
    this.filled = false,
  });

  final String text;
  final DieFaces faces;

  final TextStyle? style;
  final double padding;
  final bool filled;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ThemeData theme = Theme.of(context);

    final isBold = filled ? "bold_" : "";

    final String chosenFaces = faces == DieFaces.d12Alt
        ? "d12_alt"
        : faces.name;

    var color = filled
        ? theme.colorScheme.surface
        : theme.colorScheme.onSurface;

    var textStyle = style ?? theme.textTheme.headlineSmall;
    //TODO: Add a header and footer text option
    return Stack(
      alignment: Alignment.center,
      children: [
        SvgPicture.asset(
          "assets/images/dice/dice_$isBold$chosenFaces.svg",
          theme: SvgTheme(
            currentColor: theme.colorScheme.onSurface,
          ),
          width: (style?.fontSize ?? 50) * padding,
          height: (style?.fontSize ?? 50) * padding,
        ),
        Positioned.fill(
          child: Align(
            alignment: Alignment.center,
            child: FittedBox(
              fit: BoxFit.fitWidth,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: AppSpacing.lg,
                ),
                child: Text(
                  text,
                  style: textStyle?.copyWith(
                    color: color,
                    fontWeight: FontWeight.bold,
                    height: 1.5,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Polymath.filled(
    this.text, {
    super.key,
    this.faces = DieFaces.d4,
    this.style,
    this.padding = 3.5,
    this.filled = true,
  });
}
