import 'package:drift/drift.dart';
import 'package:flutter_drift_app/src/features/category/domain/categories.dart';
import 'package:flutter_drift_app/src/features/category/domain/category.dart';
import 'package:flutter_drift_app/src/shared/drift/store/store.dart'
    hide Categories, Category;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'category_service.g.dart';

@riverpod
CategoryService categoryService(Ref ref) {
  return CategoryService(ref.watch(driftStoreProvider));
}

class CategoryService {
  const CategoryService(this.store);

  final DriftStore store;

  $DriftStoreManager get _managers => store.managers;

  Future<int> createCategory(Category category) {
    return _managers.categories.create(category.create);
  }

  Future<int> updateCategory(Category category) {
    return _managers.categories.update(category.update);
  }

  Future<bool> deleteCategory(Category category) {
    return store.categories.deleteOne(category.toDrift());
  }

  Stream<Categories> emitsCategories() {
    return _managers.categories.watch().map((list) {
      return Categories(list.map(Category.fromDrift));
    });
  }
}
