import 'package:flutter/material.dart';
import 'core/config/theme.dart';
import 'core/config/router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Theme mode provider for toggling between light and dark theme
final themeProvider = StateProvider<ThemeMode>((ref) => ThemeMode.system);

class MiniMALApp extends ConsumerWidget {
  const MiniMALApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Watch the theme mode from the provider
    final themeMode = ref.watch(themeProvider);
    final router = ref.watch(routerProvider);

    return MaterialApp.router(
      title: 'mini MAL',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: themeMode,
      debugShowCheckedModeBanner: false,
      routerConfig: router,
    );
  }
}
