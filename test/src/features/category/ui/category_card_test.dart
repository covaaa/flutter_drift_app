import 'package:flutter_drift_app/src/features/category/category.dart';
import 'package:flutter_test/flutter_test.dart';
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
    'should tap category card',
    (tester) async {
      // TODO(cova): add assertion
      await tester.pumpApp(child: CategoryCard(category));
      await tester.tap(find.byType(CategoryCard));
    },
  );
}
