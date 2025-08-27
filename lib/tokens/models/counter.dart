import 'package:freezed_annotation/freezed_annotation.dart';
part 'gen/counter.freezed.dart';

@freezed
class Counter with _$Counter {
  const Counter({required this.count});

  @override
  final int count;
}
