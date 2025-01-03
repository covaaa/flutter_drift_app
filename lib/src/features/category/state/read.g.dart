// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: duplicate_ignore

// coverage:ignore-file

part of 'read.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$readCategoriesHash() => r'a13e6ac81cc2b2d62c25ce4f258e5104f74403f8';

/// See also [readCategories].
@ProviderFor(readCategories)
final readCategoriesProvider = AutoDisposeStreamProvider<Categories>.internal(
  readCategories,
  name: r'readCategoriesProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$readCategoriesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef ReadCategoriesRef = AutoDisposeStreamProviderRef<Categories>;
String _$readCategoryHash() => r'17cc79de82c0526708a601ea7e77124e7626871b';

/// See also [ReadCategory].
@ProviderFor(ReadCategory)
final readCategoryProvider =
    AutoDisposeNotifierProvider<ReadCategory, Option<Category>>.internal(
  ReadCategory.new,
  name: r'readCategoryProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$readCategoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ReadCategory = AutoDisposeNotifier<Option<Category>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
