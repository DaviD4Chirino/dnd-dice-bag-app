import 'dart:async';

import 'package:flutter_hooks/flutter_hooks.dart';

/// Animates a number from [initialValue] to [finalValue] over [duration].
/// Returns the current animated value (int).
int useAnimatedNumber({
  int initialValue = 0,
  required int finalValue,
  required Duration duration,
  int step = 1,
}) {
  final value = useState<int>(initialValue);

  useEffect(() {
    if (duration.inMilliseconds == 0) {
      value.value = finalValue;
      return null;
    }
    Timer? timer;
    if (value.value < finalValue) {
      timer = Timer.periodic(duration, (t) {
        value.value = (value.value + step).clamp(
          initialValue,
          finalValue,
        );
        if (value.value >= finalValue) {
          t.cancel();
        }
      });
    }
    return timer?.cancel;
  }, [value.value, finalValue, duration, step]);

  return value.value;
}
