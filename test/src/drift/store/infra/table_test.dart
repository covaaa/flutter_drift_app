import 'package:flutter_drift_app/src/drift/store/store.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late Preferences preferences;
  late Todos todos;
  late Categories categories;

  setUp(
    () {
      preferences = Preferences();
      todos = Todos();
      categories = Categories();
    },
  );

  test(
    'should get props',
    () {
      expect(() => preferences.id, throwsUnsupportedError);
      expect(() => preferences.mode, throwsUnsupportedError);
      expect(() => preferences.color, throwsUnsupportedError);
      expect(() => preferences.createdAt, throwsUnsupportedError);
      expect(() => preferences.updatedAt, throwsUnsupportedError);

      expect(() => todos.id, throwsUnsupportedError);
      expect(() => todos.title, throwsUnsupportedError);
      expect(() => todos.category, throwsUnsupportedError);
      expect(() => todos.createdAt, throwsUnsupportedError);
      expect(() => todos.updatedAt, throwsUnsupportedError);

      expect(() => categories.id, throwsUnsupportedError);
      expect(() => categories.title, throwsUnsupportedError);
      expect(() => categories.color, throwsUnsupportedError);
      expect(() => categories.createdAt, throwsUnsupportedError);
      expect(() => categories.updatedAt, throwsUnsupportedError);
    },
  );
}
