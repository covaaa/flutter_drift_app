import 'package:flutter/material.dart';
import 'package:flutter_drift_app/src/features/category/state/read.dart';
import 'package:flutter_drift_app/src/features/category/ui/category_card.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';

class CategoriesDrawer extends ConsumerWidget {
  const CategoriesDrawer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final asyncCategories = ref.watch(readCategoriesProvider);
    return NavigationDrawer(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(28, 16, 16, 10),
          child: Text(
            'Categories',
            style: theme.textTheme.titleSmall,
          ),
        ),
        SingleChildScrollView(
          child: asyncCategories.whenOrNull(
            data: (categories) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Column(
                children: List.of(
                  categories.map(some).map(CategoryCard.new),
                )..insert(0, const CategoryCard(None())),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
