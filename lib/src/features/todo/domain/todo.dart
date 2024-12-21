import 'package:equatable/equatable.dart';
import 'package:flutter_drift_app/src/shared/local/local.dart';

final class Todo extends Equatable {
  const Todo({required this.id, required this.body});
  factory Todo.fromData(TodoData data) => Todo(id: data.id, body: data.body);
  final int id;
  final String body;
  @override
  List<Object> get props => [id, body];
  TodoData toData() => TodoData(id: id, body: body);
  Todo copyWith({String? body}) => Todo(id: id, body: body ?? this.body);
}
