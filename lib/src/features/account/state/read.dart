import 'package:flutter_drift_app/src/features/account/domain/preference.dart';
import 'package:flutter_drift_app/src/features/account/infra/preference_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'read.g.dart';

@riverpod
Stream<Preference> readPreference(Ref ref) {
  return ref.watch(
    preferenceServiceProvider.select((service) => service.emitsPreference()),
  );
}
