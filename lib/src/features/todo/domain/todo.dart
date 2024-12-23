import 'package:equatable/equatable.dart';
import 'package:flutter_drift_app/src/shared/drift/drift.dart';
import 'package:fpdart/fpdart.dart';

final class Todo extends Equatable {
  const Todo({required this.id, required this.body, this.due = const None()});
  factory Todo.fromData(TodoData data) {
    return Todo(id: data.id, body: data.body, due: optionOf(data.due));
  }
  final int id;
  final String body;
  final Option<DateTime> due;
  @override
  List<Object> get props => [id, body, due];
  TodoData toData() => TodoData(id: id, body: body);
  Todo copyWith({String? body, DateTime? due}) {
    return Todo(
      id: id,
      body: body ?? this.body,
      due: optionOf(due).match(() => this.due, some),
    );
  }
}
