import 'package:flutter/material.dart';
import 'package:flutter_drift_app/src/features/category/category.dart';
import 'package:flutter_drift_app/src/features/todo/todo.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'home_page.g.dart';

@riverpod
GlobalObjectKey<ScaffoldState> homeScaffoldKey(Ref ref) {
  return const GlobalObjectKey<ScaffoldState>('home_scaffold');
}

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncTodos = ref.watch(readDriftTodosProvider);
    return Scaffold(
      key: ref.watch(homeScaffoldKeyProvider),
      drawer: const CategoriesDrawer(),
      body: asyncTodos.whenOrNull(
        data: (todos) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: CustomScrollView(
            slivers: [
              const SliverAppBar.large(title: Text('Flutter Drift App')),
              SliverList(
                delegate: SliverChildListDelegate.fixed(
                  List.of(todos.map(TodoCard.new)),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => TodoCreateSheet.show(context),
        icon: const Icon(Icons.add_outlined),
        label: const Text('New Todo'),
      ),
    );
  }
}
