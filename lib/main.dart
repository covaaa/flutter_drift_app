import 'dart:async';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_drift_app/src/core/core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  FlutterError.onError = (details) {
    return log(details.exceptionAsString(), stackTrace: details.stack);
  };
  return runZonedGuarded<void>(
    () {
      WidgetsFlutterBinding.ensureInitialized();
      return runApp(const ProviderScope(child: App()));
    },
    (error, stackTrace) => log('$error', stackTrace: stackTrace),
  );
}
