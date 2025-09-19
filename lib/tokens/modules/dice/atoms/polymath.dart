import 'package:dice_bag/tokens/app/app_spacing.dart';
import 'package:dice_bag/tokens/mixins/consumer_mixin.dart';
import 'package:dice_bag/tokens/models/dice/die.dart';
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
    required this.die,
    this.footerText,
    this.style,
    this.padding = 1.5,
  });
  final Die die;

  final String text;
  final String? footerText;

  final TextStyle? style;
  final double padding;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ThemeData theme = Theme.of(context);

    var color = die.filled
        ? theme.colorScheme.surfaceContainerLowest
        : theme.colorScheme.inverseSurface;

    var reversedColor = die.filled
        ? theme.colorScheme.inverseSurface
        : theme.colorScheme.surfaceContainerLowest;

    var textStyle = style ?? theme.textTheme.headlineSmall;
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
            child: StrokeText(
              text: text,
              textStyle: textStyle?.copyWith(
                color: color,
                fontWeight: FontWeight.bold,
                height: 0.8,
              ),
              textAlign: TextAlign.center,
              strokeColor: reversedColor,
              strokeWidth: 3.5,
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
//45D100(+3000) = 517499D100(+9000000000) = 9000005106

class OutlineText extends StatelessWidget {
  const OutlineText(this.child, {super.key});
  final Text child;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: Align(
            alignment: Alignment.center,
            child: child,
          ),
        ),
        Positioned.fill(
          child: Align(
            alignment: Alignment.center,
            child: Text(child.data ?? ""),
          ),
        ),
      ],
    );
  }
}

//21D100 = 1144
class StrokeText2 extends StatefulWidget {
  const StrokeText2({
    super.key,
    this.width,
    this.height,
    this.text,
    this.textSize,
    this.textColor,
    this.strokeColor,
    this.letterSpacing,
    this.strokeWidth,
  });

  final double? width;
  final double? height;
  final String? text;
  final double? textSize;
  final Color? textColor;
  final Color? strokeColor;
  final double? letterSpacing;
  final double? strokeWidth;

  @override
  State<StrokeText2> createState() => _StrokeText2State();
}

class _StrokeText2State extends State<StrokeText2> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Implement the stroke
        Text(
          widget.text ?? '',
          style: TextStyle(
            fontSize: widget.textSize ?? 16,
            letterSpacing: widget.letterSpacing ?? 0,
            fontWeight: FontWeight.bold,
            foreground: Paint()
              ..style = PaintingStyle.stroke
              ..strokeWidth = widget.strokeWidth ?? 4
              ..color = widget.strokeColor ?? Colors.black,
          ),
        ),
        // The text inside
        Text(
          widget.text ?? '',
          style: TextStyle(
            fontSize: widget.textSize ?? 16,
            letterSpacing: widget.letterSpacing ?? 0,
            fontWeight: FontWeight.bold,
            color: widget.textColor ?? Colors.white,
          ),
        ),
      ],
    );
  }
}
