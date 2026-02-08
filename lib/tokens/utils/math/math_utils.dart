class MathUtils {
  MathUtils._();

  /// Calculates the progress between [min] and [max] based on [input].
  static double calculateProgress(num min, num max, num input) {
    var normalizedInput = input.clamp(min, max);

    //(actual - min) / (max - min)

    return (normalizedInput - min) / (max - min);
  }
}
