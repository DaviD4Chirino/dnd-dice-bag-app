// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../dice_bag_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

@ProviderFor(DiceBagNotifier)
const diceBagNotifierProvider = DiceBagNotifierProvider._();

final class DiceBagNotifierProvider
    extends $NotifierProvider<DiceBagNotifier, List<DiceSet>> {
  const DiceBagNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'diceBagNotifierProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$diceBagNotifierHash();

  @$internal
  @override
  DiceBagNotifier create() => DiceBagNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<DiceSet> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<DiceSet>>(value),
    );
  }
}

String _$diceBagNotifierHash() => r'b9aa01ea95844543bda71d2ac0e6e8790a968fc8';

abstract class _$DiceBagNotifier extends $Notifier<List<DiceSet>> {
  List<DiceSet> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<List<DiceSet>, List<DiceSet>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<List<DiceSet>, List<DiceSet>>,
              List<DiceSet>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
