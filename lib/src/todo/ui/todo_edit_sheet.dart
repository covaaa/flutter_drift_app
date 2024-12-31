import 'package:flutter/material.dart';
import 'package:flutter_drift_app/src/todo/domain/todo.dart';
import 'package:flutter_drift_app/src/todo/ui/todo_delete_dialog.dart';
import 'package:flutter_drift_app/src/todo/ui/todo_update_sheet.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TodoEditSheet extends ConsumerWidget {
  const TodoEditSheet(this.todo, {super.key});

  final DriftTodo todo;

  static Future<void> show(
    BuildContext context, {
    required DriftTodo todo,
  }) {
    final theme = Theme.of(context);
    return showModalBottomSheet<void>(
      context: context,
      useSafeArea: true,
      showDragHandle: true,
      useRootNavigator: true,
      isScrollControlled: true,
      backgroundColor: theme.colorScheme.surface,
      builder: (context) => TodoEditSheet(todo),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxHeight: 125),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            children: [
              IconButton.filledTonal(
                onPressed: () => TodoUpdateSheet.show(context, todo: todo),
                iconSize: 36,
                padding: const EdgeInsets.all(16),
                icon: const Icon(Icons.edit_outlined),
              ),
              const SizedBox(height: 12),
              const Text('Edit'),
            ],
          ),
          Column(
            children: [
              IconButton.filledTonal(
                onPressed: () => TodoDeleteDialog.show(context, todo: todo),
                iconSize: 36,
                padding: const EdgeInsets.all(16),
                icon: const Icon(Icons.delete_outlined),
              ),
              const SizedBox(height: 12),
              const Text('Delete'),
            ],
          ),
        ],
      ),
    );
  }
}
