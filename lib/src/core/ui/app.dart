import 'package:flutter/material.dart';
import 'package:flutter_drift_app/src/account/account.dart';
import 'package:flutter_drift_app/src/core/ui/loading.dart';
import 'package:flutter_drift_app/src/home/home.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncPreference = ref.watch(readPreferenceProvider);
    final asyncColor = ref.watch(readColorSeedProvider);
    final asyncMode = ref.watch(readThemeModeProvider);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      themeMode: asyncMode.whenOrNull(data: (mode) => mode),
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: asyncColor.whenOrNull(
          data: (seed) => ColorScheme.fromSeed(seedColor: seed.color),
        ),
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        colorScheme: asyncColor.whenOrNull(
          data: (seed) => ColorScheme.fromSeed(
            brightness: Brightness.dark,
            seedColor: seed.color,
          ),
        ),
      ),
      home: asyncPreference.maybeWhen(
        data: (preference) => const HomePage(title: 'Flutter Demo Home Page'),
        orElse: () => const LoadingPage(),
      ),
    );
  }
}
