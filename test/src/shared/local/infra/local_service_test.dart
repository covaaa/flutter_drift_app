import 'dart:io';
import 'package:flutter/services.dart';
import 'package:flutter_drift_app/src/shared/local/local.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockDirectory extends Mock implements Directory {}

class MockLocalService extends Mock implements LocalService {}

void main() {
  late ProviderContainer container;
  late LocalService localService;

  setUp(
    () {
      TestWidgetsFlutterBinding.ensureInitialized();
      container = ProviderContainer();
      localService = container.read(localServiceProvider);
    },
  );

  tearDown(() => container.dispose());

  test(
    'should fetch directory',
    () => expect(
      () => localService.fetchDirectory(),
      throwsA(isA<MissingPluginException>()),
    ),
  );
}
