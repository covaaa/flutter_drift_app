import 'package:drift/drift.dart';
import 'package:flutter_drift_app/src/features/account/domain/preference.dart';
import 'package:flutter_drift_app/src/shared/drift/store/store.dart'
    hide Preference;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'preference_service.g.dart';

@riverpod
PreferenceService preferenceService(Ref ref) {
  return PreferenceService(ref.watch(driftStoreProvider));
}

class PreferenceService {
  const PreferenceService(this.store);

  final DriftStore store;

  $PreferencesTable get _preferences => store.preferences;

  $DriftStoreManager get _managers => store.managers;

  Future<void> updatePreference(Preference preference) {
    return _preferences.replaceOne(preference.toDrift());
  }

  Stream<Preference> emitsPreference() {
    return _managers.preferences.watchSingle().map(Preference.fromDrift);
  }
}
