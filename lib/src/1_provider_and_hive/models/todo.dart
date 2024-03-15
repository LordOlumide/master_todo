import 'package:master_todo/utils/functions/util_functions.dart';

class Todo {
  final String id;
  final String name;
  final String details;
  final bool isDone;

  Todo({
    required this.name,
    required this.details,
    required this.isDone,
  }) : id = UtilFunctions.generateUniqueId();

  Todo._withId({
    required this.id,
    required this.name,
    required this.details,
    required this.isDone,
  });

  Todo copyWith({
    String? name,
    String? details,
    bool? isDone,
  }) {
    return Todo._withId(
      id: id,
      name: name ?? this.name,
      details: details ?? this.details,
      isDone: isDone ?? this.isDone,
    );
  }

  Map<String, dynamic> toMap() {
    return {'id': id, 'name': name, 'details': details, 'isDone': isDone};
  }

  factory Todo.fromMap(Map<String, dynamic> map) {
    return Todo._withId(
      id: map['id'] as String,
      name: map['name'] as String,
      details: map['details'] as String,
      isDone: map['isDone'] as bool,
    );
  }
}
