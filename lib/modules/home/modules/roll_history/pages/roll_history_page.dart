import 'package:dice_bag/modules/home/modules/roll_history/atoms/roll_history_entry.dart';
import 'package:dice_bag/providers/roll_history_provider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class RollHistoryPage extends ConsumerWidget {
  const RollHistoryPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final rollHistory = ref.watch(rollHistoryNotifierProvider);

    return Scaffold(
      body: ListView.separated(
        itemBuilder: (context, index) =>
            RollHistoryEntry(rollHistory[index]),
        separatorBuilder: (context, index) => Divider(height: 0),
        itemCount: rollHistory.length,
      ),
    );
  }
}
