import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:master_todo/src/1_provider_and_hive/data/hive_local_storage.dart';
import 'package:master_todo/src/1_provider_and_hive/screens/home_screen/home_screen.dart';
import 'package:master_todo/utils/widgets/basic_button.dart';

class IntroScreen extends StatelessWidget {
  static const String screenId = 'intro_screen';

  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        fit: StackFit.expand,
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.blue, Colors.blueGrey],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          Column(
            children: [
              const SizedBox(height: 160),
              const Text(
                'Master Todo',
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: BasicButton(
                  onPressed: () => _navigateToHomeScreen1(context),
                  color: const Color(0xFF4923c4),
                  child: const Text(
                    '1. Using Provider and Hive',
                    style: TextStyle(
                      fontSize: 21,
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Future<void> _navigateToHomeScreen1(BuildContext context) async {
    await Hive.openBox(HiveLocalStorage.boxKey);
    if (context.mounted) {
      Navigator.pushNamed(context, HomeScreen1.screenId);
    }
  }
}
