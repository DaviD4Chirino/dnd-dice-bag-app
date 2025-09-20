import 'package:dice_bag/tokens/models/dice/die.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
