import 'package:flutter/material.dart';
import 'package:flutter_drift_app/src/features/todo/domain/todo.dart';
import 'package:flutter_drift_app/src/features/todo/ui/todo_edit_sheet.dart';
import 'package:intl/intl.dart';

class TodoCard extends StatelessWidget {
  const TodoCard(this.todo, {super.key});

  final DriftTodo todo;

  @override
  Widget build(BuildContext context) {
    final yMMMd = DateFormat.yMMMd();
    final theme = Theme.of(context);
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(todo.value.title, style: theme.textTheme.titleMedium),
                  Text(
                    todo.value.due.match(() => 'No due date', yMMMd.format),
                    style: theme.textTheme.labelMedium?.copyWith(
                      color: theme.hintColor,
                    ),
                  ),
                ],
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
