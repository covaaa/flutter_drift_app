import 'package:flutter_drift_app/src/account/domain/preference.dart';
import 'package:flutter_drift_app/src/drift/store/store.dart' hide Preference;
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

  $DriftStoreManager get _managers => store.managers;

  Future<int> createPreference(Preference preference) {
    return _managers.preferences.create(preference.create);
  }

  Future<int> updatePreference(Preference preference) {
    return _managers.preferences.update(preference.update);
  }

  Stream<Preference> emitsPreference() {
    return _managers.preferences.watchSingle().map(Preference.fromDrift);
  }
}
