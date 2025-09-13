import 'package:dice_bag/tokens/models/dice/die_roll_data.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'gen/roll_history_provider.g.dart';

@Riverpod(keepAlive: true)
class RollHistoryNotifier extends _$RollHistoryNotifier {
  @override
  List<DieRollData> build() {
    return [];
  }

  void registerRoll(DieRollData roll) {
    state.add(roll);
    state = state;
  }
}
