import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:spotifier/ui/router/app.dart';

import 'firebase_options.dart';

Future<void> main() async {
  // runApp 前に　binding する
  WidgetsFlutterBinding.ensureInitialized();

  // Firebase の設定を読み込む
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  const app = App();
  const scope = ProviderScope(child: app);

  // Device Preview
  Widget window = scope;
  if (kIsWeb) {
    window = DevicePreview(
      builder: (context) => scope,
    );
  }

  runApp(window);
}
