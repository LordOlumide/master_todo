import 'package:flutter/cupertino.dart';
import 'package:master_todo/src/1_provider_and_hive/data/hive_local_storage.dart';
import 'package:master_todo/src/1_provider_and_hive/data/local_storage_interface.dart';
import 'package:master_todo/src/1_provider_and_hive/models/todo.dart';
import 'package:master_todo/src/1_provider_and_hive/providers/todo_manager_interface.dart';

class TodoManager extends ChangeNotifier implements TodoManagerInterface {
  final List<Todo> _state = [];

  final LocalStorageInterface _store = HiveLocalStorage();

  @override
  Future<void> initialize() async {
    // Simulating delay. Hive supports synchronous read operations
    // so there is actually no delay here.
    await Future.delayed(const Duration(milliseconds: 400));

    refreshFromStore();
  }

  refreshFromStore() {
    _state.clear();
    _state.addAll(_store.getAllTodos());
    notifyListeners();
  }

  @override
  List<Todo> get state => _state;

  @override
  int get totalCount => _state.length;

  @override
  int get doneCount {
    int count = 0;
    for (int i = 0; i < _state.length; i++) {
      if (_state[i].isDone == true) {
        count++;
      }
    }
    return count;
  }

  @override
  int get notDoneCount => _state.fold(
        0,
        (previousValue, element) =>
            previousValue + (element.isDone == false ? 1 : 0),
      );

  @override
  Future<void> addNewTodo(Todo newTodo) async {
    _state.add(newTodo);

    _store.addTodo(newTodo);
    refreshFromStore();
  }

  @override
  Future<void> changeReadStatus(
      {required String todoId, required bool newValue}) async {
    int indexOfTodo = _state.indexWhere((Todo todo) => todo.id == todoId);
    final Todo newTodo = _state[indexOfTodo].copyWith(isDone: newValue);
    _state[indexOfTodo] = newTodo;

    await _store.editTodo(newTodo);
    refreshFromStore();
  }

  @override
  Future<void> deleteTodo(String todoId) async {
    _state.removeWhere((Todo todo) => todo.id == todoId);

    await _store.deleteTodo(todoId);
    refreshFromStore();
  }
}
