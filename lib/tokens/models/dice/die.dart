import 'dart:math';

import 'package:freezed_annotation/freezed_annotation.dart';
part 'gen/die.freezed.dart';

@freezed
class Die with _$Die {
  const Die({
    required this.faces,
    this.amount = 1,
    this.modifier = 0,
    this.alt = false,
    this.filled = true,
  });

  @override
  final int faces;

  @override
  final int amount;

  @override
  final int modifier;

  @override
  final bool filled;

  @override
  final bool alt;

  String get modifierLabel => modifier != 0
      ? modifier > 0
            ? "(+$modifier)"
            : "($modifier)"
      : "";
  String get amountLabel => amount != 1 ? "$amount" : "";

  String get label => "${amountLabel}D$faces $modifierLabel";

  /// It generates random numbers akin to a dice roll
  /// the first element is the total amount with modifiers
  /// the rest are all the individual rolls.
  /// This cannot be negative
  List<int> roll() {
    List<int> results = [];
    for (var i = 0; i < amount; i++) {
      results.add((Random().nextInt(faces) + 1));
    }
    results.insert(
      0,
      max(0, results.reduce((a, b) => a + b) + modifier),
    );

    return results;
  }

  String get imagePath {
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

    return "assets/images/dice/dice_$filled$existingFace.svg";
  }
}
// 1D20 = 1-20
// 2D20 = 1-20*2
// 14d20 = 1-20*14
// 14d20+35 = (1-20*14)+30