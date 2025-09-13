import "dart:math";

import "package:dice_bag/tokens/models/dice/die.dart";
import "package:freezed_annotation/freezed_annotation.dart";

part 'gen/die_roll_data.freezed.dart';
part 'gen/die_roll_data.g.dart';

@freezed
@JsonSerializable()
class DieRollData with _$DieRollData {
  DieRollData({
    required this.die,
    required this.rolls,
    required this.date,
  });

  factory DieRollData.fromJson(Map<String, Object?> json) =>
      _$DieRollDataFromJson(json);
  Map<String, Object?> toJson() => _$DieRollDataToJson(this);

  @override
  Die die;
  @override
  List<int> rolls;
  @override
  DateTime date;

  String get rollStrings => rolls.join(" | ");

  int get totalValue =>
      max(0, rolls.reduce((a, b) => a + b) + die.modifier);
  /* results.insert(
      0,
      max(0, results.reduce((a, b) => a + b) + modifier),
    ); */
}
