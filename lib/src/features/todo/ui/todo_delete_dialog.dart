import 'package:flutter/material.dart';
import 'package:flutter_drift_app/src/features/todo/domain/todo.dart';
import 'package:flutter_drift_app/src/features/todo/state/deletes.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TodoDeleteDialog extends ConsumerWidget {
  const TodoDeleteDialog(this.todo, {super.key});

  final Todo todo;

  static Future<void> show(BuildContext context, {required Todo todo}) {
    return showDialog(
      context: context,
      builder: (context) => TodoDeleteDialog(todo),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AlertDialog(
      title: Text('Delete "${todo.body}"?'),
      actions: [
        Align(
          alignment: AlignmentDirectional.centerEnd,
          child: OverflowBar(
            spacing: 8,
            overflowAlignment: OverflowBarAlignment.end,
            children: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.maybePop(context);
                },
                child: const Text('Cancel'),
              ),
              OutlinedButton(
                onPressed: () {
                  ref.read(deleteTodoProvider.notifier).run(todo);
                  Navigator.pop(context);
                  Navigator.maybePop(context);
                },
                child: const Text('Delete'),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
