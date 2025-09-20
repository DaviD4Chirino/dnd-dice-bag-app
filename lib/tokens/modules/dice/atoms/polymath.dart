import 'package:dice_bag/tokens/app/app_spacing.dart';
import 'package:dice_bag/tokens/mixins/consumer_mixin.dart';
import 'package:dice_bag/tokens/models/dice/die.dart';
import 'package:dice_bag/tokens/models/dice/die_roll_data.dart';
import 'package:dice_bag/tokens/modules/dice/atoms/die_image.dart';
import 'package:dice_bag/tokens/modules/dice/atoms/polymath_footer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
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
class Polymath extends HookConsumerWidget with ConsumerMixin {
  const Polymath(
    this.text, {
    super.key,
    required this.die,
    this.footerText,
    this.style,
    this.padding = 1.5,
    this.rollData,
    this.animate = false,
  });
  final Die die;

  final String text;
  final String? footerText;

  final TextStyle? style;
  final double padding;

  final DieRollData? rollData;

  final bool animate;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ThemeData theme = Theme.of(context);

    final color = die.filled
        ? theme.colorScheme.surfaceContainer
        : theme.colorScheme.inverseSurface;

    final reversedColor = die.filled
        ? theme.colorScheme.inverseSurface
        : theme.colorScheme.surfaceContainer;

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
            child: animate
                ? FittedText(
                        text: text,
                        textStyle: textStyle,
                        color: color,
                        reversedColor: reversedColor,
                      )
                      .animate(
                        delay: const Duration(milliseconds: 50),
                      )
                      .scaleXY(
                        duration: const Duration(
                          milliseconds: 250,
                        ),
                        begin: 1,
                        end: 2,
                        curve: Curves.easeOut,
                      )
                      .then(
                        delay: const Duration(milliseconds: 100),
                      )
                      .scaleXY(
                        duration: Duration(milliseconds: 350),
                        end: 1 / 2,
                        curve: Curves.easeIn,
                      )
                : FittedText(
                    text: text,
                    textStyle: textStyle,
                    color: color,
                    reversedColor: reversedColor,
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

class FittedText extends StatelessWidget {
  const FittedText({
    super.key,
    required this.text,
    required this.textStyle,
    required this.color,
    required this.reversedColor,
  });

  final String text;
  final TextStyle? textStyle;
  final Color color;
  final Color reversedColor;

  @override
  Widget build(BuildContext context) {
    return FittedBox(
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
          OutlinedTextStroke(color: reversedColor, width: 3.5),
        ],
      ),
    );
  }
}
