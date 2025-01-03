import 'package:flutter/material.dart';
import 'package:flutter_drift_app/src/features/category/category.dart';
import 'package:flutter_drift_app/src/features/home/home.dart';
import 'package:flutter_drift_app/src/features/todo/todo.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import '../../../../extensions/tester_x.dart';
import '../../../../fakes/fakes.dart';
import '../../category/infra/category_service_test.dart';
import '../../todo/infra/todo_service_test.dart';

void main() {
  late Fakes fakes;
  late DriftTodos driftTodos;
  late Categories categories;
  late GlobalObjectKey<ScaffoldState> scaffoldKey;
  late MockTodoService mockTodoService;
  late MockCategoryService mockCategoryService;

  setUp(
    () {
      fakes = Fakes();
      driftTodos = fakes.driftTodos;
      categories = fakes.categories;
      scaffoldKey = const GlobalObjectKey<ScaffoldState>('home_scaffold');
      mockTodoService = MockTodoService();
      mockCategoryService = MockCategoryService();
    },
  );

  Stream<DriftTodos> mockEmitsDriftTodos() => mockTodoService.emitsDriftTodos();

  Stream<Categories> emitsCategories() => mockCategoryService.emitsCategories();

  testWidgets(
    'should render home page',
    (tester) async {
      when(mockEmitsDriftTodos).thenAnswer((i) => Stream.value(driftTodos));
      await tester.pumpApp(
        scaffold: false,
        overrides: [todoServiceProvider.overrideWithValue(mockTodoService)],
        child: const HomePage(),
      );
      await tester.pumpAndSettle();
      verify(mockEmitsDriftTodos).called(1);
      expect(find.byType(TodoCard), findsNWidgets(3));
      expect(find.byType(FloatingActionButton), findsOneWidget);
    },
  );

  testWidgets(
    'should render categorized home page',
    (tester) async {
      when(mockEmitsDriftTodos).thenAnswer((i) => Stream.value(driftTodos));
      when(emitsCategories).thenAnswer((i) => Stream.value(categories));
      await tester.pumpApp(
        scaffold: false,
        overrides: [
          todoServiceProvider.overrideWithValue(mockTodoService),
          categoryServiceProvider.overrideWithValue(mockCategoryService),
          homeScaffoldKeyProvider.overrideWithValue(scaffoldKey),
        ],
        child: const HomePage(),
      );
      await tester.pumpAndSettle();
      verify(mockEmitsDriftTodos).called(1);
      expect(find.byType(TodoCard), findsNWidgets(3));
      expect(find.byType(FloatingActionButton), findsOneWidget);
      scaffoldKey.currentState!.openDrawer();
      await tester.pump();
      verify(emitsCategories).called(1);
      expect(find.byType(NavigationDrawer), findsOneWidget);
      await tester.pump();
      expect(find.byType(CategoryCard), findsNWidgets(2));
      await tester.pumpAndSettle();
      await tester.tap(find.byType(CategoryCard).last);
      await tester.pumpAndSettle();
      expect(find.byType(TodoCard), findsOneWidget);
    },
  );

  testWidgets(
    'should show todo create sheet',
    (tester) async {
      when(mockEmitsDriftTodos).thenAnswer((i) => Stream.value(driftTodos));
      await tester.pumpApp(
        scaffold: false,
        overrides: [todoServiceProvider.overrideWithValue(mockTodoService)],
        child: const HomePage(),
      );
      await tester.pumpAndSettle();
      verify(mockEmitsDriftTodos).called(1);
      expect(find.byType(TodoCard), findsNWidgets(3));
      expect(find.byType(FloatingActionButton), findsOneWidget);
      await tester.tap(find.byIcon(Icons.add_outlined));
      await tester.pumpAndSettle();
      expect(find.byType(TodoCreateSheet), findsOneWidget);
    },
  );
}
