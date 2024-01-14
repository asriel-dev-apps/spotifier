import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:spotifier/ui/pages/develop_page/develop_page.dart';
import 'package:spotifier/ui/router/page_path.dart';

/// Provide GoRouter
final goRouterProvider = Provider(
  (ref) {
    final routes = [
      GoRoute(
        path: PageId.develop.path,
        name: PageId.develop.routeName,
        builder: (context, state) {
          return const DevelopPage();
        },
      ),
    ];

    return GoRouter(
      initialLocation: PageId.develop.path,
      debugLogDiagnostics: false,
      routes: routes,
    );
  },
);
