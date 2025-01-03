import 'package:flutter/material.dart';
import 'package:flutter_drift_app/src/features/category/domain/category.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard(this.category, {super.key});

  final Category category;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
      clipBehavior: Clip.antiAlias,
      color: theme.colorScheme.surfaceBright,
      child: InkWell(
        onTap: () {
          // TODO(cova): should show sorted todos on home page
        },
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: category.color.color,
                  ),
                  child: const SizedBox.square(dimension: 20),
                ),
              ),
              Text(
                category.title,
                style: theme.textTheme.bodySmall,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
