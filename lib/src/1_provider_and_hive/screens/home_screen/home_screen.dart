import 'package:flutter/material.dart';
import 'package:master_todo/src/1_provider_and_hive/data/hive_local_storage.dart';
import 'package:master_todo/src/1_provider_and_hive/models/todo.dart';
import 'package:master_todo/src/1_provider_and_hive/providers/todo_manager.dart';
import 'package:master_todo/src/1_provider_and_hive/screens/home_screen/components/delete_dialog.dart';
import 'package:master_todo/src/1_provider_and_hive/screens/home_screen/components/home_top_section.dart';
import 'package:master_todo/src/1_provider_and_hive/screens/home_screen/components/new_todo_dialog.dart';
import 'package:master_todo/src/1_provider_and_hive/screens/home_screen/components/todo_card.dart';
import 'package:provider/provider.dart';

part './home_screen_view.dart';

class HomeScreen1 extends StatelessWidget {
  static const String screenId = 'home_screen';

  const HomeScreen1({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<HiveLocalStorage>(create: (context) => HiveLocalStorage()),
        ChangeNotifierProvider(create: (context) => TodoManager()),
      ],
      child: Builder(builder: (context) {
        return FutureBuilder(
            future: context.read<TodoManager>().initialize(),
            builder: (context, snapshot) {
              if (snapshot.connectionState != ConnectionState.done) {
                return const Scaffold(
                  body: Center(child: CircularProgressIndicator()),
                );
              }
              return Scaffold(
                body: const HomeScreenView(),
                floatingActionButton: FloatingActionButton(
                  onPressed: () async {
                    Todo? newTodo = await showDialog(
                      context: context,
                      builder: (context) => const NewTodoDialog(),
                    );
                    if (newTodo == null) {
                      return;
                    }

                    if (context.mounted) {
                      context.read<TodoManager>().addNewTodo(newTodo);
                    }
                  },
                  child: const Icon(Icons.add),
                ),
              );
            });
      }),
    );
  }
}
