// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_in.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$signInHash() => r'1bac6e2050329f953554d421dd7abb310e66cd29';

/// See also [signIn].
@ProviderFor(signIn)
final signInProvider = AutoDisposeFutureProvider<void>.internal(
  signIn,
  name: r'signInProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$signInHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef SignInRef = AutoDisposeFutureProviderRef<void>;
String _$emailHash() => r'950b982538839037d49c36045b0267cbe23402ec';

/// See also [Email].
@ProviderFor(Email)
final emailProvider = AutoDisposeNotifierProvider<Email, String?>.internal(
  Email.new,
  name: r'emailProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$emailHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$Email = AutoDisposeNotifier<String?>;
String _$passwordHash() => r'01c4919ea1cdf3f8704e19e325bf988f1e6d3346';

/// See also [Password].
@ProviderFor(Password)
final passwordProvider =
    AutoDisposeNotifierProvider<Password, String?>.internal(
  Password.new,
  name: r'passwordProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$passwordHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$Password = AutoDisposeNotifier<String?>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
