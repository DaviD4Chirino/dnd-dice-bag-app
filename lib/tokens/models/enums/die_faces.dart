/// Only d12 has an alt version
// enum DieFaces { d4, d6, d8, d10, d12, d12Alt, d20 }
abstract class DieFaces {
  static DieFace d4 = DieFace("D4", 4);
  static DieFace d6 = DieFace("D6", 6);
  static DieFace d8 = DieFace("D8", 8);
  static DieFace d10 = DieFace("D10", 10);
  static DieFace d12 = DieFace("D12", 12);
  static DieFace d12Alt = DieFace("D12", 12);
  static DieFace d20 = DieFace("D20", 20);
}

class DieFace {
  DieFace(this.label, this.amount);

  String label;
  int amount;
}
