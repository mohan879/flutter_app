// GENERATED CODE - DO NOT MODIFY BY HAND

part of '11_prefer_immutable_provider_arguments.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// --- prefer-immutable-provider-arguments ---
///
/// Warns when a Provider's argument does not have a consistent `==`.
/// If you pass a value that doesn't support stable equality checks, Riverpod
/// can't know whether the "new" argument is logically the same as the old one.
///
/// Issues this rule prevents:
/// - Unnecessary rebuilds – widget rebuilds even if nothing meaningful changed
/// - Lost caching – Riverpod thinks you're asking for "new" data every time
/// - Stale data – providers don't reuse results across identical inputs
// Single family provider generated via riverpod_generator (matches DCM example)

@ProviderFor(someProvider)
final someProviderProvider = SomeProviderFamily._();

/// --- prefer-immutable-provider-arguments ---
///
/// Warns when a Provider's argument does not have a consistent `==`.
/// If you pass a value that doesn't support stable equality checks, Riverpod
/// can't know whether the "new" argument is logically the same as the old one.
///
/// Issues this rule prevents:
/// - Unnecessary rebuilds – widget rebuilds even if nothing meaningful changed
/// - Lost caching – Riverpod thinks you're asking for "new" data every time
/// - Stale data – providers don't reuse results across identical inputs
// Single family provider generated via riverpod_generator (matches DCM example)

final class SomeProviderProvider
    extends $FunctionalProvider<String, String, String>
    with $Provider<String> {
  /// --- prefer-immutable-provider-arguments ---
  ///
  /// Warns when a Provider's argument does not have a consistent `==`.
  /// If you pass a value that doesn't support stable equality checks, Riverpod
  /// can't know whether the "new" argument is logically the same as the old one.
  ///
  /// Issues this rule prevents:
  /// - Unnecessary rebuilds – widget rebuilds even if nothing meaningful changed
  /// - Lost caching – Riverpod thinks you're asking for "new" data every time
  /// - Stale data – providers don't reuse results across identical inputs
  // Single family provider generated via riverpod_generator (matches DCM example)
  SomeProviderProvider._({
    required SomeProviderFamily super.from,
    required Object super.argument,
  }) : super(
         retry: null,
         name: r'someProviderProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$someProviderHash();

  @override
  String toString() {
    return r'someProviderProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $ProviderElement<String> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  String create(Ref ref) {
    final argument = this.argument as Object;
    return someProvider(ref, argument);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(String value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<String>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is SomeProviderProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$someProviderHash() => r'90d081c41c63aa2f97cb7386e1802f0b595cadd3';

/// --- prefer-immutable-provider-arguments ---
///
/// Warns when a Provider's argument does not have a consistent `==`.
/// If you pass a value that doesn't support stable equality checks, Riverpod
/// can't know whether the "new" argument is logically the same as the old one.
///
/// Issues this rule prevents:
/// - Unnecessary rebuilds – widget rebuilds even if nothing meaningful changed
/// - Lost caching – Riverpod thinks you're asking for "new" data every time
/// - Stale data – providers don't reuse results across identical inputs
// Single family provider generated via riverpod_generator (matches DCM example)

final class SomeProviderFamily extends $Family
    with $FunctionalFamilyOverride<String, Object> {
  SomeProviderFamily._()
    : super(
        retry: null,
        name: r'someProviderProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// --- prefer-immutable-provider-arguments ---
  ///
  /// Warns when a Provider's argument does not have a consistent `==`.
  /// If you pass a value that doesn't support stable equality checks, Riverpod
  /// can't know whether the "new" argument is logically the same as the old one.
  ///
  /// Issues this rule prevents:
  /// - Unnecessary rebuilds – widget rebuilds even if nothing meaningful changed
  /// - Lost caching – Riverpod thinks you're asking for "new" data every time
  /// - Stale data – providers don't reuse results across identical inputs
  // Single family provider generated via riverpod_generator (matches DCM example)

  SomeProviderProvider call(Object arg) =>
      SomeProviderProvider._(argument: arg, from: this);

  @override
  String toString() => r'someProviderProvider';
}
