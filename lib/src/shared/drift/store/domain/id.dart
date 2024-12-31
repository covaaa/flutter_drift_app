import 'package:equatable/equatable.dart';

interface class DriftIdOf<T> extends Equatable {
  const DriftIdOf({required this.id, required this.value});
  final int id;
  final T value;
  @override
  List<Object?> get props => [id, value];
}
