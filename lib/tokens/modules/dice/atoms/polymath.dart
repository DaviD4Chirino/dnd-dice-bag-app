import 'package:dice_bag/tokens/app/app_spacing.dart';
import 'package:dice_bag/tokens/mixins/consumer_mixin.dart';
import 'package:dice_bag/tokens/models/dice/die.dart';
import 'package:dice_bag/tokens/modules/dice/atoms/polymath_footer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:outlined_text/outlined_text.dart';

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
    required this.die,
    this.footerText,
    this.style,
    this.padding = 1.5,
    this.animate = false,
  });
  final Die die;

  final String text;
  final String? footerText;

  final TextStyle? style;
  final double padding;

  final bool animate;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ThemeData theme = Theme.of(context);

    final color = die.filled
        ? theme.colorScheme.surfaceContainerLowest
        : theme.colorScheme.inverseSurface;

    final reversedColor = die.filled
        ? theme.colorScheme.inverseSurface
        : theme.colorScheme.surfaceContainerLowest;

    final textStyle = style ?? theme.textTheme.headlineSmall;
    //TODO: Add a header text option
    return Stack(
      alignment: Alignment.center,
      children: [
        DieImage(
          die,
          width: (style?.fontSize ?? 50) * padding,
          height: (style?.fontSize ?? 50) * padding,
          theme: SvgTheme(
            currentColor: theme.colorScheme.inverseSurface,
          ),
        ),
        Positioned.fill(
          child: Align(
            alignment: Alignment.center,
            child: FittedBox(
              fit: BoxFit.fitWidth,
              child: OutlinedText(
                //TODO: Make your own goddamn text animation you lazy fuck
                text: Text(
                  text,
                  style: textStyle?.copyWith(
                    color: color,
                    fontWeight: FontWeight.bold,
                    height: 0.8,
                  ),
                  textAlign: TextAlign.center,

                  // strokeColor: reversedColor,
                  // strokeWidth: 3.5,
                ),
                strokes: [
                  OutlinedTextStroke(
                    color: reversedColor,
                    width: 3.5,
                  ),
                ],
              ),
            ),
          ),
        ),

        if (footerText != null)
          Positioned.fill(
            bottom: AppSpacing.sm,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: PolymathFooter(
                text: footerText,
                color: color,
                reversedColor: reversedColor,
              ),
            ),
          ),
      ],
    );
  }
}

class DieImage extends StatelessWidget {
  const DieImage(
    this.die, {
    super.key,
    this.width,
    this.height,
    this.theme,
  });

  final Die die;

  final double? width;
  final double? height;

  final SvgTheme? theme;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      die.imagePath,
      theme: theme,
      width:
          width /* (style?.fontSize ?? 50) * (padding ?? 1.5) */,
      height:
          height /*  (style?.fontSize ?? 50) * (padding ?? 1.5) */,
    );
  }
}
