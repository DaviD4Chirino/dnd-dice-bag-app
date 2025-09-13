import 'dart:convert';

import 'package:dice_bag/tokens/models/dice/die_roll_data.dart';
import 'package:dice_bag/tokens/modules/local_storage/models/local_storage.dart';
import 'package:dice_bag/tokens/modules/local_storage/models/local_storage_paths.dart';
import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'gen/roll_history_provider.g.dart';

@Riverpod(keepAlive: true)
class RollHistoryNotifier extends _$RollHistoryNotifier {
  @override
  List<DieRollData> build() {
    // LocalStorage.clear();
    var savedHistory = LocalStorage.getStringList(
      LocalStoragePaths.diceBag,
    );
    List<DieRollData>? history = savedHistory
        ?.map(
          (json) =>
              DieRollData.fromJson(JsonCodec().decode(json)),
        )
        .toList();

    return history ?? [];
  }

  void registerRoll(DieRollData roll) {
    state.insert(0, roll);

    if (state.length >= 50) {
      state.removeRange(state.length - 1, state.length);
    }

    state = state;
    saveHistory();
  }

  // I dont wanna handle errors, sorry
  Future<bool>? saveHistory() {
    try {
      var json = JsonCodec();
      var jsonState = state.map((e) => json.encode(e)).toList();
      return LocalStorage.setStringList(
        LocalStoragePaths.diceBag,
        jsonState,
      );
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
    return null;
  }
}
