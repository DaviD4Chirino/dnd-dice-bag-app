import 'package:dice_bag/tokens/utils/math/math_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:liquid_progress_indicator_v2/liquid_progress_indicator.dart';
import 'package:outlined_text/outlined_text.dart';

class CounterPage extends HookWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    const maxProgress = 10;
    final progress = useState(0);

    void increment() {
      progress.value++;
    }

    void decrement() {
      progress.value--;
    }

    return Scaffold(
      appBar: AppBar(title: const Text('Counter Page')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,

        children: [
          Center(
            child: SizedBox(
              width: 200,
              height: 200,
              child: LiquidCircularProgressIndicator(
                value: switch (progress.value) {
                  <= 0.0 => -1,
                  >= maxProgress => 1.1,
                  _ => MathUtils.calculateProgress(
                    0,
                    maxProgress,
                    progress.value,
                  ).toDouble(),
                },
                center: OutlinedText(
                  text: Text(
                    '${progress.value} / $maxProgress',
                    style: theme.textTheme.headlineLarge
                        ?.copyWith(fontWeight: FontWeight.bold),
                  ),
                  strokes: [
                    OutlinedTextStroke(
                      color: theme.colorScheme.surface,
                      width: 4,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                onPressed: decrement,
                icon: const Icon(Icons.remove),
              ),
              const SizedBox(width: 10),
              IconButton(
                onPressed: increment,
                icon: const Icon(Icons.add),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
