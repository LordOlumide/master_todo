import 'package:hive_flutter/hive_flutter.dart';
import 'package:master_todo/src/1_provider_and_hive/data/local_storage_interface.dart';
import 'package:master_todo/src/1_provider_and_hive/models/todo.dart';

class HiveLocalStorage implements LocalStorageInterface {
  static const String boxKey = 'Todo box';

  final Box _box;

  HiveLocalStorage() : _box = Hive.box(boxKey);

  @override
  List<Todo> getAllTodos() {
    final List<Todo> todos = [];
    for (dynamic value in _box.values) {
      final Todo todo = Todo.fromMap(Map<String, dynamic>.from(value));
      todos.add(todo);
    }
    return todos;
  }

  @override
  Future<void> addTodo(Todo todo) async {
    await _box.put(todo.id, todo.toMap());
  }

  @override
  Future<void> editTodo(Todo todo) async {
    await addTodo(todo);
  }

  @override
  Future<void> deleteTodo(String todoId) async {
    await _box.delete(todoId);
  }
}
