import 'package:flutter_drift_app/src/features/category/domain/category.dart';

extension type const Categories._(List<Category> _list)
    implements List<Category> {
  factory Categories(Iterable<Category> iterable) {
    return Categories._(List.unmodifiable(iterable));
  }
}
