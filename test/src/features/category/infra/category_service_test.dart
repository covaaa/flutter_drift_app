import 'package:drift/drift.dart';
import 'package:flutter_drift_app/src/features/category/category.dart';
import 'package:flutter_drift_app/src/shared/drift/store/store.dart'
    hide Categories, Category;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import '../../../../fakes/fakes.dart';

class MockCategoryService extends Mock implements CategoryService {}

void main() {
  late Fakes fakes;
  late Category category1;
  late Category category2;
  late Categories categories;
  late QueryExecutor connection;
  late ProviderContainer container;
  late CategoryService service;

  setUp(
    () {
      fakes = Fakes();
      category1 = fakes.category1;
      category2 = fakes.category2;
      categories = fakes.categories;
      connection = fakes.connection;
      container = ProviderContainer(
        overrides: [driftDatabaseProvider.overrideWithValue(connection)],
      );
      service = container.read(categoryServiceProvider);
    },
  );

  tearDown(() => container.dispose());

  test(
    'should create category',
    () {
      expect(service.createCategory(category2), completion(2));
    },
  );

  test(
    'should update category',
    () {
      expect(service.updateCategory(category1), completion(isA<void>()));
    },
  );

  test(
    'should delete category',
    () {
      expect(service.deleteCategory(category1), completion(isTrue));
    },
  );

  test(
    'should emits categories',
    () {
      expect(
        service.emitsCategories(),
        emits(
          isA<Categories>()
              .having(
                (categories) => categories.map((category) => category.id),
                'should be expected ids',
                categories.map((category) => category.id),
              )
              .having(
                (categories) => categories.map((category) => category.title),
                'should be expected titles',
                categories.map((category) => category.title),
              )
              .having(
                (categories) => categories.map((category) => category.color),
                'should be expected colors',
                categories.map((category) => category.color),
              ),
        ),
      );
    },
  );
}
