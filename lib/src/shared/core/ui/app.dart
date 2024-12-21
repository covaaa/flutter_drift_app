import 'package:flutter/material.dart';
import 'package:flutter_drift_app/src/features/home/home.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    const color = Colors.deepPurple;
    return MaterialApp(
      title: 'Flutter Drift Todos',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: color),
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          brightness: Brightness.dark,
          seedColor: color,
        ),
      ),
      home: const HomePage(),
    );
  }
}
