import 'package:flutter_drift_app/src/features/category/category.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import '../../../../extensions/tester_x.dart';
import '../../../../fakes/fakes.dart';

void main() {
  late Fakes fakes;
  late Category category;

  setUp(
    () {
      fakes = Fakes();
      category = fakes.category1;
    },
  );

  testWidgets(
    'should tap none category card',
    (tester) async {
      await tester.pumpApp(child: const CategoryCard(None()));
      await tester.tap(find.byType(CategoryCard));
    },
  );

  testWidgets(
    'should tap some category card',
    (tester) async {
      await tester.pumpApp(child: CategoryCard(some(category)));
      await tester.tap(find.byType(CategoryCard));
    },
  );
}
