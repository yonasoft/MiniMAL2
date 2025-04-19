import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:minimal/app.dart';


void main() {
  // Ensure Flutter is initialized
  WidgetsFlutterBinding.ensureInitialized();

  // Run the app wrapped with ProviderScope for Riverpod
  runApp(const ProviderScope(child: MiniMALApp()));
}
