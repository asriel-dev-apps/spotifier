import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:spotifier/application/state/user.dart';
import 'package:spotifier/application/usecases/auth/sign_out.dart';

class DevelopPage extends ConsumerStatefulWidget {
  const DevelopPage({super.key});

  @override
  ConsumerState<DevelopPage> createState() => _DevelopPageState();
}

class _DevelopPageState extends ConsumerState<DevelopPage> {
  @override
  Widget build(BuildContext context) {
    // ボタン
    final button = ElevatedButton(
      onPressed: () async {
        // サインアウト
        await ref.read(signOutProvider.future).catchError(
              (e) => debugPrint('🍎${e.toString()}'),
            );
      },
      child: const Text('サインアウト'),
    );
    final uid = ref.watch(userIdProvider);
    // FIXME: 一旦debug入れている
    debugPrint('🐱$uid');
    return Scaffold(
      body: Center(
        child: button,
      ),
    );
  }
}
