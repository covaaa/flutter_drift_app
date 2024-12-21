import 'dart:async';
import 'dart:developer' as dev;
import 'package:flutter/material.dart';
import 'package:flutter_drift_app/src/shared/core/core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  FlutterError.onError = (details) {
    return dev.log(details.exceptionAsString(), stackTrace: details.stack);
  };
  return runZonedGuarded<void>(
    () {
      WidgetsFlutterBinding.ensureInitialized();
      return runApp(
        ProviderScope(
          observers: [RiverpodObserver()],
          child: const App(),
        ),
      );
    },
    (error, stackTrace) => dev.log('$error', stackTrace: stackTrace),
  );
}
