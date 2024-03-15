import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:master_todo/intro_screen.dart';
import 'package:master_todo/src/1_provider_and_hive/screens/home_screen/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  await Hive.initFlutter();

  runApp(const MasterTodoApp());
}

class MasterTodoApp extends StatelessWidget {
  const MasterTodoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: IntroScreen.screenId,
      routes: {
        IntroScreen.screenId: (context) => const IntroScreen(),
        HomeScreen1.screenId: (context) => const HomeScreen1(),
      },
    );
  }
}
