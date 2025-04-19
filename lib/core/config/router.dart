import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../presentation/screens/main_screen.dart';

// Provider for the router
final routerProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: '/',
    routes: [
      ShellRoute(
        builder: (context, state, child) {
          return MainScreen(child: child);
        },
        routes: [
          // Home route
          GoRoute(
            path: '/',
            name: 'home',
            pageBuilder: (context, state) {
              return NoTransitionPage(child: HomeTab());
            },
          ),
          // Discover route
          GoRoute(
            path: '/discover',
            name: 'discover',
            pageBuilder: (context, state) {
              return NoTransitionPage(child: DiscoverTab());
            },
          ),
          // My Lists route
          GoRoute(
            path: '/my-lists',
            name: 'myLists',
            pageBuilder: (context, state) {
              return NoTransitionPage(child: MyListsTab());
            },
          ),
        ],
      ),
    ],
  );
});
