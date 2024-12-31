import 'package:flutter/material.dart';
import 'package:flutter_drift_app/src/todo/todo.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncTodos = ref.watch(readTodosProvider);
    return Scaffold(
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
        onPressed: () {
          // TODO(cova): should create new todo
        },
        icon: const Icon(Icons.add_outlined),
        label: const Text('New Todo'),
      ),
    );
  }
}
