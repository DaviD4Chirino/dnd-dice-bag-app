import "package:dice_bag/tokens/models/dice/die.dart";
import "package:freezed_annotation/freezed_annotation.dart";

part 'gen/dice_bag.freezed.dart';
part 'gen/dice_bag.g.dart';

@freezed
abstract class DiceBag with _$DiceBag {
  const factory DiceBag({
    required String label,
    required List<Die> dice,
  }) = _DiceBag;

  factory DiceBag.fromJson(Map<String, Object?> json) =>
      _$DiceBagFromJson(json);
}
