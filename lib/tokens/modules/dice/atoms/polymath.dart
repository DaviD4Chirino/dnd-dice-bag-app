import 'package:dice_bag/tokens/app/app_spacing.dart';
import 'package:dice_bag/tokens/mixins/consumer_mixin.dart';
import 'package:dice_bag/tokens/models/enums/die_faces.dart';
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
    this.faces = DieFaces.d4,
    this.style,
    this.padding = 3.5,
    this.filled = false,
  });

  final String text;
  final String? footerText;
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
    var reversedColor = filled
        ? theme.colorScheme.onSurface
        : theme.colorScheme.surface;

    var textStyle = style ?? theme.textTheme.headlineSmall;
    //TODO: Add a header text option
    return Stack(
      alignment: Alignment.center,
      children: [
        DieImage(
          isBold: isBold,
          chosenFaces: chosenFaces,
          style: style,
          padding: padding,
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
    this.faces = DieFaces.d4,
    this.footerText,
    this.style,
    this.padding = 3.5,
  }) : filled = true;
}

class DieImage extends StatelessWidget {
  const DieImage({
    super.key,
    required this.isBold,
    required this.chosenFaces,
    required this.style,
    required this.padding,
  });

  final String isBold;
  final String chosenFaces;
  final TextStyle? style;
  final double padding;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return SvgPicture.asset(
      "assets/images/dice/dice_$isBold$chosenFaces.svg",
      theme: SvgTheme(currentColor: theme.colorScheme.onSurface),
      width: (style?.fontSize ?? 50) * padding,
      height: (style?.fontSize ?? 50) * padding,
    );
  }
}
