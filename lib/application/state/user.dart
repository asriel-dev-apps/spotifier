import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'user.g.dart';

// Firebaseのユーザーを AsyncValue型 で管理するProvider
@riverpod
Stream<User?> userChanges(UserChangesRef ref) {
  // Firebaseからユーザーの変化を教えてもらう
  return FirebaseAuth.instance.authStateChanges();
}

// ユーザー
@riverpod
User? user(UserRef ref) {
  final userChanges = ref.watch(userChangesProvider);
  return userChanges.when(
    loading: () => null,
    error: (_, __) => null,
    data: (d) => d,
  );
}

// サインイン中かどうか
@riverpod
bool signedIn(SignedInRef ref) {
  final user = ref.watch(userProvider);
  return user != null;
}

/// ---------------------------------------------------------
/// ユーザーIDを使えるスコープ    >> router/user_id_scope.dart
/// ---------------------------------------------------------

// ユーザーID
@riverpod
String userId(UserIdRef ref) {
  throw 'スコープ内の画面でしか使えません';
}

class UserIdScope extends ConsumerWidget {
  const UserIdScope({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    /// サインインしているユーザーの情報
    final user = ref.watch(userProvider);
    if (user == null) {
      // ユーザーが見つからない時はIndicator表示
      return const CircularProgressIndicator();
    } else {
      // ユーザーが見つかったとき
      return ProviderScope(
        // ユーザーIDを上書き
        overrides: [
          userIdProvider.overrideWithValue(user.uid),
        ],
        child: child,
      );
    }
  }
}
