import 'package:flutter_drift_app/src/features/category/domain/categories.dart';
import 'package:flutter_drift_app/src/features/category/domain/category.dart';
import 'package:flutter_drift_app/src/features/category/infra/category_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'read.g.dart';

@riverpod
Stream<Categories> readCategories(Ref ref) {
  return ref.watch(
    categoryServiceProvider.select((service) => service.emitsCategories()),
  );
}

@riverpod
class ReadCategory extends _$ReadCategory {
  @override
  Option<Category> build() => const None();
  Option<Category> run(Option<Category> category) => state = category;
}
