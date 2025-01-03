import 'package:flutter/material.dart';
import 'package:flutter_drift_app/src/features/category/domain/category.dart';
import 'package:flutter_drift_app/src/features/category/state/read.dart';
import 'package:flutter_drift_app/src/shared/core/core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';

class CategoryCard extends ConsumerWidget {
  const CategoryCard(this.category, {super.key});

  final Option<Category> category;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    return Card(
      clipBehavior: Clip.antiAlias,
      color: theme.colorScheme.surfaceContainer,
      child: InkWell(
        onTap: () {
          ref.read(readCategoryProvider.notifier).run(category);
          Navigator.maybePop(context);
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
                    color: category.map((some) {
                      return some.color.color;
                    }).getOrElse(() => ColorAccent.gray.color),
                  ),
                  child: const SizedBox.square(dimension: 20),
                ),
              ),
              Text(
                category.map((some) => some.title).getOrElse(() => 'All'),
                style: theme.textTheme.bodySmall,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
