// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../roll_history_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

@ProviderFor(RollHistoryNotifier)
const rollHistoryNotifierProvider = RollHistoryNotifierProvider._();

final class RollHistoryNotifierProvider
    extends $NotifierProvider<RollHistoryNotifier, List<DieRollData>> {
  const RollHistoryNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'rollHistoryNotifierProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$rollHistoryNotifierHash();

  @$internal
  @override
  RollHistoryNotifier create() => RollHistoryNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<DieRollData> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<DieRollData>>(value),
    );
  }
}

String _$rollHistoryNotifierHash() =>
    r'87482d5eff2cb713ad1ee90f93ba946503801808';

abstract class _$RollHistoryNotifier extends $Notifier<List<DieRollData>> {
  List<DieRollData> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<List<DieRollData>, List<DieRollData>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<List<DieRollData>, List<DieRollData>>,
              List<DieRollData>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
