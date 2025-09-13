import 'dart:math';

import 'package:dice_bag/tokens/models/dice/die_roll_data.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'gen/die.freezed.dart';
part 'gen/die.g.dart';

@freezed
@JsonSerializable()
class Die with _$Die {
  Die({
    required this.faces,
    this.amount = 1,
    this.modifier = 0,
    this.alt = false,
    this.filled = true,
  });

  @override
  final int faces;

  @override
  int amount;

  @override
  int modifier;

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

  String get label => "${amountLabel}D$faces$modifierLabel";

  String get imagePath {
    //? Maybe store this in an easy-to-add array or some shit
    final existingFace =
        faces == 2 ||
            faces == 4 ||
            faces == 6 ||
            faces == 8 ||
            faces == 10 ||
            faces == 12 ||
            faces == 20
        ? faces == 12 && alt
              ? "d12_alt"
              : "d$faces"
        : "d_any";
    final bold = filled ? "bold_" : "";
    return "assets/images/dice/dice_$bold$existingFace.svg";
  }

  /// It generates random numbers akin to a dice roll
  /// the first element is the total amount with modifiers
  /// the rest are all the individual rolls.
  /// This cannot be negative
  DieRollData roll() {
    List<int> results = [];
    for (var i = 0; i < amount; i++) {
      results.add((Random().nextInt(faces) + 1));
    }

    return DieRollData(
      die: this,
      rolls: results,
      date: DateTime.now(),
    );
  }

  factory Die.fromJson(Map<String, Object?> json) =>
      _$DieFromJson(json);
  Map<String, Object?> toJson() => _$DieToJson(this);
}
// 1D20 = 1-20
// 2D20 = 1-20*2
// 14d20 = 1-20*14
// 14d20+35 = (1-20*14)+30