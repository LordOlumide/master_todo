import 'package:master_todo/src/1_provider_and_hive/models/todo.dart';

abstract interface class TodoManagerInterface {
  Future<void> initialize();

  List<Todo> get state;

  int get totalCount;
  int get doneCount;
  int get notDoneCount;

  Future<void> addNewTodo(Todo newTodo);

  Future<void> changeReadStatus(
      {required String todoId, required bool newValue});

  Future<void> deleteTodo(String todoId);
}
