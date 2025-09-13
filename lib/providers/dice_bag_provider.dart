import 'package:dice_bag/tokens/models/dice/dice_set.dart';
import 'package:dice_bag/tokens/models/dice/die.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'gen/dice_bag_provider.g.dart';

@Riverpod(keepAlive: true)
class DiceBagNotifier extends _$DiceBagNotifier {
  @override
  List<DiceSet> build() {
    return [
      DiceSet(
        label: "Generated Dice Bag",
        dice: [
          Die(faces: 4),
          Die(faces: 6),
          Die(faces: 8),
          Die(faces: 10),
          Die(faces: 12),
          Die(faces: 20),
        ],
      ),
    ];
  }

  void addSet(DiceSet diceSet) {
    state.add(diceSet);
    state = state;
  }
}
