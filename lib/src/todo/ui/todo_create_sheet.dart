import 'package:flutter/material.dart';
import 'package:flutter_drift_app/src/todo/domain/todo.dart';
import 'package:flutter_drift_app/src/todo/state/create.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TodoCreateSheet extends ConsumerStatefulWidget {
  const TodoCreateSheet({super.key});

  static Future<void> show(BuildContext context) async {
    final theme = Theme.of(context);
    return showModalBottomSheet<void>(
      context: context,
      useSafeArea: true,
      showDragHandle: true,
      useRootNavigator: true,
      isScrollControlled: true,
      backgroundColor: theme.colorScheme.surface,
      builder: (context) => const TodoCreateSheet(),
    );
  }

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _TodoCreateSheetState();
  }
}

class _TodoCreateSheetState extends ConsumerState<TodoCreateSheet> {
  final _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        children: [
          const SizedBox(height: 24),
          Text(
            'Create a new todo!',
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
          Expanded(
            child: Center(
              child: Column(
                children: [
                  const SizedBox(height: 48),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      FilledButton.tonal(
                        onPressed: () => Navigator.pop(context),
                        child: const Text('Cancel'),
                      ),
                      FilledButton.tonalIcon(
                        onPressed: () {
                          if (_controller.text.isNotEmpty) {
                            final todo = Todo(title: _controller.text);
                            ref.read(createTodoProvider.notifier).run(todo);
                            _controller.clear();
                          }
                          Navigator.of(context).pop();
                        },
                        icon: const Icon(Icons.send_outlined),
                        label: const Text('Create'),
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
