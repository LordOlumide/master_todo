import 'package:master_todo/src/1_provider_and_hive/models/todo.dart';

abstract interface class LocalStorageInterface {
  List<Todo> getAllTodos();

  Future<void> addTodo(Todo todo);

  Future<void> editTodo(Todo todo);

  Future<void> deleteTodo(String todoId);
}
