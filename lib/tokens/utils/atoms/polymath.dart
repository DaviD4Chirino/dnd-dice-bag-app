import 'package:dice_bag/tokens/mixins/consumer_mixin.dart';
import 'package:dice_bag/tokens/models/enums/die_faces.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class Polymath extends ConsumerWidget with ConsumerMixin {
  const Polymath(
    this.text, {
    super.key,
    this.faces = DieFaces.d4,
    this.style,
    this.padding = 60,
  });

  final String text;
  final DieFaces faces;

  final TextStyle? style;
  final double padding;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ThemeData theme = Theme.of(context);

    final isBold = style?.fontWeight == FontWeight.bold
        ? "bold_"
        : "";

    final String chosenFaces = faces == DieFaces.d12Alt
        ? "d12_alt"
        : faces.name;

    var color = style?.fontWeight == FontWeight.bold
        ? theme.colorScheme.surface
        : theme.colorScheme.onSurface;

    return Stack(
      children: [
        SvgPicture.asset(
          "assets/images/dice/dice_$isBold$chosenFaces.svg",
          theme: SvgTheme(
            currentColor: theme.colorScheme.onSurface,
          ),
          width: (style?.fontSize ?? 50) + padding,
          height: (style?.fontSize ?? 50) + padding,
        ),
        Positioned.fill(
          child: Align(
            alignment: Alignment.center,
            child: Text(
              text,
              style: (style ?? theme.textTheme.headlineSmall)
                  ?.copyWith(
                    color: color,
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ),
        ),
      ],
    );
  }
}
