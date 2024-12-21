import 'package:flutter/material.dart';
import 'package:flutter_drift_app/src/features/todo/todo.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final asyncTodos = ref.watch(readTodosProvider);
    return Scaffold(
      appBar: AppBar(
        titleTextStyle: theme.textTheme.headlineSmall?.copyWith(
          fontWeight: FontWeight.bold,
        ),
        title: const Text('Flutter Drift Todos'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: asyncTodos.maybeWhen(
          orElse: () => const Align(child: CircularProgressIndicator()),
          data: (todos) => ListView(children: List.of(todos.map(TodoCard.new))),
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
