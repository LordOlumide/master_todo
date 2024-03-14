import 'package:flutter/material.dart';
import 'package:master_todo/src/screens/home_screen.dart';

void main() {
  runApp(const MasterTodoApp());
}

class MasterTodoApp extends StatelessWidget {
  const MasterTodoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: HomeScreen.screenId,
      routes: {
        HomeScreen.screenId: (context) => const HomeScreen(),
      },
    );
  }
}
