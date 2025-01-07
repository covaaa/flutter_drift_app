import 'dart:async';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_drift_app/src/shared/core/core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';

void main() {
  FlutterError.onError = (details) {
    return log(details.exceptionAsString(), stackTrace: details.stack);
  };
  return runZonedGuarded<void>(
    () {
      WidgetsFlutterBinding.ensureInitialized();
      // final container = ProviderContainer();
      // final preference = await TaskEither.tryCatch(
      //   () async => container.read(readPreferenceProvider.future),
      //   (error, stackTrace) => Failure('$error'),
      // ).run();
      return runApp(
        ProviderScope(
          observers: [RiverpodObserver()],
          child: const App(Left(Failure('Fake Exception'))),
        ),
      );
    },
    (error, stackTrace) => log('$error', stackTrace: stackTrace),
  );
}
