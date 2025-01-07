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
    const seed = ColorSeed.deepPurple;
    final themeDataLight = ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(seedColor: seed.color),
    );
    final themeDataDark = ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: seed.color,
        brightness: Brightness.dark,
      ),
    );
    return preferenceOrFailure.match(
      (failure) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: title,
        theme: themeDataLight,
        darkTheme: themeDataDark,
        home: const Scaffold(
          body: Center(child: Text('Oops! Something went wrong.')),
        ),
      ),
      (preference) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: title,
        themeMode: preference.mode,
        theme: themeDataLight.copyWith(
          colorScheme: themeDataLight.colorScheme.copyWith(
            primary: preference.color.color,
          ),
        ),
        darkTheme: themeDataDark.copyWith(
          colorScheme: themeDataDark.colorScheme.copyWith(
            primary: preference.color.color,
          ),
        ),
        home: const HomePage(),
      ),
    );
  }
}
