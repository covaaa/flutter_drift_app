import 'package:flutter/material.dart';
import 'package:flutter_drift_app/src/features/todo/domain/todo.dart';
import 'package:flutter_drift_app/src/features/todo/ui/todo_edit_sheet.dart';

class TodoCard extends StatelessWidget {
  TodoCard(this.todo) : super(key: ObjectKey(todo.id));

  final Todo todo;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [Text(todo.body, style: theme.textTheme.bodyLarge)],
              ),
            ),
            IconButton(
              onPressed: () => TodoEditSheet.show(context, todo: todo),
              icon: const Icon(Icons.more_vert_outlined),
            ),
          ],
        ),
      ),
    );
  }
}
