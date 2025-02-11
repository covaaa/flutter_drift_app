import 'package:flutter/material.dart';
import 'package:flutter_drift_app/src/features/account/account.dart';
import 'package:flutter_drift_app/src/features/home/home.dart';
import 'package:flutter_drift_app/src/shared/core/domain/color_seed.dart';
import 'package:flutter_drift_app/src/shared/core/domain/failure.dart';
import 'package:fpdart/fpdart.dart';

class App extends StatelessWidget {
  const App(this.preferenceOrFailure, {super.key});

  final Either<Failure, Preference> preferenceOrFailure;

  @override
  Widget build(BuildContext context) {
    const title = 'Flutter Drift App';
    return preferenceOrFailure.match(
      (failure) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: title,
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(
            seedColor: ColorSeed.deepPurple.color,
          ),
        ),
        darkTheme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(
            seedColor: ColorSeed.deepPurple.color,
            brightness: Brightness.dark,
          ),
        ),
        home: const Scaffold(
          body: Center(child: Text('Oops! Something went wrong.')),
        ),
      ),
      (preference) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: title,
        themeMode: preference.mode,
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: preference.color.color),
        ),
        darkTheme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(
            seedColor: preference.color.color,
            brightness: Brightness.dark,
          ),
        ),
        home: const HomePage(),
      ),
    );
  }
}
