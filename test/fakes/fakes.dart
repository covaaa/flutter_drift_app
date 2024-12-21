import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:flutter_drift_app/src/features/todo/todo.dart';
import 'package:flutter_drift_app/src/shared/local/local.dart';

final class Fakes {
  DatabaseConnection get connection {
    return DatabaseConnection(NativeDatabase.memory());
  }

  TodoCreatable get todoCreatable {
    return TodoCreatable(body: 'fake body');
  }

  Todo get todo {
    return const Todo(id: 1, body: 'fake body');
  }

  TodoData get todoDataMigratedCheckout {
    return const TodoData(id: 1, body: 'Check out drift');
  }

  // TodoData get todoDataMigratedFix {
  //   return const TodoData(
  //     id: 2,
  //     category: 1,
  //     body: 'Fix session invalidation bug',
  //   );
  // }

  TodoData get todoDataMigratedAdd {
    return const TodoData(id: 2, body: 'Add favorite movies to home page');
  }

  // TodoCategoryData get todoCategoryData {
  //   return const TodoCategoryData(
  //     id: 1,
  //     label: 'Important',
  //     color: Color(0xfff44336),
  //   );
  // }

  // Todos get todosCategorized {
  //   return Todos(
  //     [Todo.fromData(todo: todoDataMigratedFix, category: todoCategoryData)],
  //   );
  // }

  Todos get todosNonCategorized {
    return Todos(
      [
        Todo.fromData(todoDataMigratedCheckout),
        Todo.fromData(todoDataMigratedAdd),
      ],
    );
  }
}
