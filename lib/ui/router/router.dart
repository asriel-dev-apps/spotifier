import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:spotifier/application/state/user.dart';
import 'package:spotifier/ui/pages/develop_page/develop_page.dart';
import 'package:spotifier/ui/pages/sign_in_page/sign_in_page.dart';
import 'package:spotifier/ui/router/page_path.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'router.g.dart';

/// NOTE: Provider を riverpod gen. で作成 (※ https://gyazo.com/efef00a6a8085977d1f89d9cee83c0bc)
/// → routes(変数), redirect(メソッド), listenable(メソッド)を定義し、GoRouter()の引数に代入して返す
@riverpod
GoRouter router(RouterRef ref) {
  final routes = [
    // サインイン画面
    GoRoute(
      path: PageId.signIn.path,
      builder: (_, __) => const SignInPage(),
    ),

    // ユーザーIDスコープで囲むためのシェル
    ShellRoute(
      builder: (_, __, child) => UserIdScope(child: child),
      routes: [
        // FIXME: 一旦dev画面
        GoRoute(
          path: PageId.develop.path,
          builder: (_, __) => const DevelopPage(),
        ),
      ],
    ),
  ];

  // リダイレクト: 強制的に画面を変更する
  String? redirect(BuildContext context, GoRouterState state) {
    // 表示しようとしている画面
    final page = state.uri.toString();
    // サインインしているかどうか
    final signedIn = ref.read(signedInProvider);

    if (signedIn && page == PageId.signIn.path) {
      // 既サインイン時にサインイン画面を表示しようとする -> dev画面
      return PageId.develop.path;
    } else if (!signedIn) {
      // 未サインイン -> サインイン画面へ
      return PageId.signIn.path;
    } else {
      return null;
    }
  }

  // リフレッシュリスナブル: サインインしている状態で、何らかの要因でサインアウト -> サインイン画面へ遷移
  // サインイン状態が切り替わった際に GoRouter が反応する
  final listenable = ValueNotifier<Object?>(null);
  ref.listen<Object?>(signedInProvider, (_, newState) {
    listenable.value = newState;
  });
  ref.onDispose(listenable.dispose);

  // GoRouterを作成
  return GoRouter(
    initialLocation: PageId.signIn.path,
    routes: routes,
    redirect: redirect,
    refreshListenable: listenable,
  );
}
