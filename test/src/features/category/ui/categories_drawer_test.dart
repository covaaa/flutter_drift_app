import 'package:flutter/material.dart';
import 'package:flutter_drift_app/src/features/category/category.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import '../../../../extensions/tester_x.dart';
import '../../../../fakes/fakes.dart';
import '../../category/infra/category_service_test.dart';

void main() {
  late Fakes fakes;
  late Categories categories;
  late GlobalKey<ScaffoldState> scaffoldKey;
  late MockCategoryService mockCategoryService;

  setUp(
    () {
      fakes = Fakes();
      categories = fakes.categories;
      scaffoldKey = GlobalKey<ScaffoldState>();
      mockCategoryService = MockCategoryService();
    },
  );

  Stream<Categories> emitsCategories() => mockCategoryService.emitsCategories();

  testWidgets(
    'should show categories drawer',
    (tester) async {
      when(emitsCategories).thenAnswer((i) => Stream.value(categories));
      await tester.pumpApp(
        scaffold: false,
        overrides: [
          categoryServiceProvider.overrideWithValue(mockCategoryService),
        ],
        child: Scaffold(key: scaffoldKey, drawer: const CategoriesDrawer()),
      );
      scaffoldKey.currentState!.openDrawer();
      await tester.pump();
      verify(emitsCategories).called(1);
      expect(find.byType(NavigationDrawer), findsOneWidget);
      await tester.pump();
      expect(find.byType(CategoryCard), findsNWidgets(2));
    },
  );
}
