import 'package:drift/drift.dart';
import 'package:flutter_drift_app/src/category/category.dart';
import 'package:flutter_drift_app/src/drift/store/store.dart'
    hide Categories, Category;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import '../../../fakes/fakes.dart';

class MockCategoryService extends Mock implements CategoryService {}

void main() {
  late Fakes fakes;
  late Category category;
  late Categories categories;
  late QueryExecutor connection;
  late ProviderContainer container;
  late CategoryService service;

  setUp(
    () {
      fakes = Fakes();
      category = fakes.category1;
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
      expect(service.createCategory(category), completion(2));
    },
  );

  test(
    'should update category',
    () async {
      await service.createCategory(category);
      expect(service.updateCategory(category), completion(2));
    },
  );

  test(
    'should delete category',
    () async {
      await service.createCategory(category);
      expect(service.deleteCategory(category), completion(isTrue));
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
