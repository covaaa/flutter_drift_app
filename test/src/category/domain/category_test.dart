import 'package:flutter_drift_app/src/category/category.dart';
import 'package:flutter_test/flutter_test.dart';
import '../../../fakes/fakes.dart';

void main() {
  late Fakes fakes;
  late Category category;

  setUp(
    () {
      fakes = Fakes();
      category = fakes.category1;
    },
  );

  test(
    'should get props',
    () {
      expect(category.props, isA<List<Object?>>());
    },
  );
}
