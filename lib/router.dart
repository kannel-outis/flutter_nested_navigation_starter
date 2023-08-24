import 'package:flutter/material.dart';
import 'package:flutter_nested_navigation_starter/files.dart';
import 'package:flutter_nested_navigation_starter/home.dart';
import 'package:flutter_nested_navigation_starter/settings.dart';
import 'package:go_router/go_router.dart';

import 'profile.dart';
import 'root.dart';

class NavRouter {
  static const routes = _Routes();

  static final rootNavKey = GlobalKey<NavigatorState>();

  static final router = GoRouter(
    // initialLocation: "/",
    navigatorKey: rootNavKey,
    routes: [
      GoRoute(
        path: "/",
        builder: (context, state) => MyHomePage(),
      ),
      GoRoute(
        path: routes.settings,
        builder: (context, state) => const SettingsPage(),
      ),
      GoRoute(
        path: routes.files,
        builder: (context, state) => const FilesPage(),
        routes: [
          GoRoute(
            path: ":folder",
            name: "namedFolder",
            builder: (context, state) {
              return FilesPage(
                pageNumber: int.tryParse(state.pathParameters["folder"] ?? ""),
              );
            },
          )
        ],
      ),
    ],
  );
}

class _Routes {
  const _Routes();
  final String home = "/home";
  final String files = "/files";
  final String profile = "/profile";
  final String settings = "/settings";
}
