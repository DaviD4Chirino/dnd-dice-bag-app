import "package:dice_bag/tokens/models/dice/die.dart";
import "package:freezed_annotation/freezed_annotation.dart";

part 'gen/dice_set.freezed.dart';
part 'gen/dice_set.g.dart';

@freezed
abstract class DiceSet with _$DiceSet {
  const factory DiceSet({
    required String label,
    required List<Die> dice,
  }) = _DiceSet;

  factory DiceSet.fromJson(Map<String, Object?> json) =>
      _$DiceSetFromJson(json);
}
