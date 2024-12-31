import 'package:flutter/material.dart';
import 'package:flutter_drift_app/src/todo/todo.dart';

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
                children: [
                  Text(todo.title, style: theme.textTheme.titleMedium),
                ],
              ),
            ),
            IconButton(
              onPressed: () {
                // TODO(cova): should show edit sheet
              },
              icon: const Icon(Icons.more_vert_outlined),
            ),
          ],
        ),
      ),
    );
  }
}
