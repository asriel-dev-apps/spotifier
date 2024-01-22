import 'package:firebase_auth/firebase_auth.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'sign_in.g.dart';

// サインイン
@riverpod
Future<void> signIn(SignInRef ref) async {
  final String? email = ref.read(emailProvider); // riverpod genのクラスメソッド内はref使える
  final String? password = ref.read(passwordProvider); // 同上
  await FirebaseAuth.instance.signInWithEmailAndPassword(
    email: email ?? '',
    password: password ?? '',
  );
}

// メールアドレス
@riverpod
class Email extends _$Email {
  @override
  String? build() {
    return null;
  }

  void update(String newState) {
    state = newState;
  }
}

// // パスワード
@riverpod
class Password extends _$Password {
  @override
  String? build() {
    return null;
  }

  void update(String newState) {
    state = newState;
  }
}
