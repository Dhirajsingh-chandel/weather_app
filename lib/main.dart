import 'package:flutter/material.dart';
import 'package:weather_app/view/splash_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'controller/setting_controller.dart';


void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  // This widget is the root of the application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDarkMode = ref.watch(darkModeProvider);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: isDarkMode ? ThemeData.dark() : ThemeData.light(),
      home:  const SplashPage(),
    );
  }
}

