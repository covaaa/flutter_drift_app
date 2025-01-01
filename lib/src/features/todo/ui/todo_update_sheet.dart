import 'package:flutter/material.dart';
import 'package:flutter_drift_app/src/features/todo/domain/todo.dart';
import 'package:flutter_drift_app/src/features/todo/state/update.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:intl/intl.dart';

class TodoUpdateSheet extends ConsumerStatefulWidget {
  const TodoUpdateSheet(this.todo, {super.key});

  final DriftTodo todo;

  static Future<void> show(BuildContext context, {required DriftTodo todo}) {
    final theme = Theme.of(context);
    return showModalBottomSheet<void>(
      context: context,
      useSafeArea: true,
      showDragHandle: true,
      useRootNavigator: true,
      isScrollControlled: true,
      backgroundColor: theme.colorScheme.surface,
      builder: (context) => TodoUpdateSheet(todo),
    );
  }

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _TodoUpdateSheetState();
  }
}

class _TodoUpdateSheetState extends ConsumerState<TodoUpdateSheet> {
  final _controller = TextEditingController();
  late Option<DateTime> _due;

  @override
  void initState() {
    _controller.text = widget.todo.value.title;
    _due = widget.todo.value.due;
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final yMMMd = DateFormat.yMMMd();
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        children: [
          const SizedBox(height: 24),
          Text(
            'Update a todo!',
            style: theme.textTheme.headlineLarge,
          ),
          const SizedBox(height: 24),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: TextField(
              controller: _controller,
              decoration: const InputDecoration(
                hintText: 'What needs to be done?',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              TextButton.icon(
                onPressed: () async {
                  final now = DateTime.now();
                  final initialDate = _due.getOrElse(() => now);
                  final selectedDate = optionOf(
                    await showDatePicker(
                      context: context,
                      initialDate: initialDate,
                      firstDate: initialDate.isBefore(now) ? initialDate : now,
                      lastDate: DateTime(3000),
                    ),
                  );
                  setState(
                    () => selectedDate.map((date) => _due = optionOf(date)),
                  );
                },
                icon: const Icon(Icons.calendar_today),
                label: Text(
                  'Date: ${_due.match(() => 'No date set', yMMMd.format)}',
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: theme.hintColor,
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: Center(
              child: Column(
                children: [
                  const SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      FilledButton.tonal(
                        onPressed: () {
                          Navigator.pop(context);
                          Navigator.maybePop(context);
                        },
                        child: const Text('Cancel'),
                      ),
                      FilledButton.tonalIcon(
                        onPressed: () {
                          final newText = _controller.text;
                          final newTodo = widget.todo.copyWith(
                            title: newText.isNotEmpty ? newText : null,
                            due: _due.toNullable(),
                          );
                          ref.read(updateTodoProvider.notifier).run(newTodo);
                          Navigator.pop(context);
                          Navigator.maybePop(context);
                        },
                        icon: const Icon(Icons.send_outlined),
                        label: const Text('Update'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
