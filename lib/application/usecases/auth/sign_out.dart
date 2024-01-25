import 'package:firebase_auth/firebase_auth.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'sign_out.g.dart';

// サインアウト
@riverpod
Future<void> signOut(SignOutRef ref) async {
  await FirebaseAuth.instance.signOut();
}
