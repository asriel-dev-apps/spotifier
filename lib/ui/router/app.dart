import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:spotifier/ui/router/router.dart';
import 'package:spotifier/ui/theme/fonts.dart';

// import 'package:firebase_analytics/firebase_analytics.dart';

/// アプリ本体
class App extends ConsumerWidget {
  const App({super.key});

  // // Firebase analytics 設定
  // static FirebaseAnalytics analytics = FirebaseAnalytics.instance;
  // // 画面遷移を監視して screen_view を送信する
  // static FirebaseAnalyticsObserver observer = FirebaseAnalyticsObserver(
  //   analytics: analytics,
  // );

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);
    return MaterialApp.router(
      builder: DevicePreview.appBuilder, // DevicePreview
      routerDelegate: router.routerDelegate, // GoRouter
      routeInformationParser: router.routeInformationParser, // GoRouter
      routeInformationProvider: router.routeInformationProvider, // GoRouter
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: AppText.bodyS.fontFamily,
      ),
    );
  }
}
