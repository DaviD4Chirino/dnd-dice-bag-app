import 'package:dice_bag/tokens/app/app_spacing.dart';
import 'package:dice_bag/tokens/mixins/consumer_mixin.dart';
import 'package:dice_bag/tokens/modules/dice/atoms/polymath_footer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:stroke_text/stroke_text.dart';

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
    this.footerText,
    this.faces = 20,
    this.style,
    this.padding = 1.5,
    this.filled = false,
  });

  final String text;
  final String? footerText;
  final int faces;

  final TextStyle? style;
  final double padding;
  final bool filled;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ThemeData theme = Theme.of(context);

    var color = filled
        ? theme.colorScheme.surfaceContainerLowest
        : theme.colorScheme.inverseSurface;

    var reversedColor = filled
        ? theme.colorScheme.inverseSurface
        : theme.colorScheme.surfaceContainerLowest;

    var textStyle = style ?? theme.textTheme.headlineSmall;
    //TODO: Add a header text option
    return Stack(
      alignment: Alignment.center,
      children: [
        DieImage(
          alt: true,
          filled: filled,
          faces: faces,
          width: (style?.fontSize ?? 50) * padding,
          height: (style?.fontSize ?? 50) * padding,
          theme: SvgTheme(
            currentColor: theme.colorScheme.inverseSurface,
          ),
        ),
        Positioned.fill(
          child: Align(
            alignment: Alignment.center,
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: AppSpacing.sm,
              ),
              child:
                  //TODO: Make this scalable
                  StrokeText(
                    text: text,
                    textStyle: textStyle?.copyWith(
                      color: color,
                      fontWeight: FontWeight.bold,
                      height: 1.5,
                    ),
                    textAlign: TextAlign.center,
                    maxLines: 1,
                    strokeColor: reversedColor,
                    strokeWidth: 3.5,
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

  Polymath.filled(
    this.text, {
    super.key,
    this.faces = 4,
    this.footerText,
    this.style,
    this.padding = 3.5,
  }) : filled = true;
}

class DieImage extends StatelessWidget {
  const DieImage({
    super.key,
    required this.faces,
    this.filled = false,
    this.alt = false,
    this.width,
    this.height,
    this.theme,
  });

  /// Only d12 has an alt
  final bool alt;

  final bool filled;

  final double? width;
  final double? height;

  final int faces;

  final SvgTheme? theme;

  @override
  Widget build(BuildContext context) {
    final existingFace =
        faces == 4 ||
            faces == 6 ||
            faces == 8 ||
            faces == 12 ||
            faces == 20
        ? faces == 12 && alt
              ? "d12_alt"
              : "d$faces"
        : "d4";
    final isFilled = filled ? "bold_" : "";

    return SvgPicture.asset(
      "assets/images/dice/dice_$isFilled$existingFace.svg",
      theme: theme,
      width:
          width /* (style?.fontSize ?? 50) * (padding ?? 1.5) */,
      height:
          height /*  (style?.fontSize ?? 50) * (padding ?? 1.5) */,
    );
  }
}
