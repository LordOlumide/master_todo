import 'package:flutter/material.dart';

abstract class UtilFunctions {
  static String generateUniqueId([String? seed]) {
    final String id = DateTime.now().millisecondsSinceEpoch.toString();
    if (seed == null) return id;
    return '$seed-$id';
  }

  static _closeSnackBars(BuildContext context) {
    ScaffoldMessenger.of(context).clearSnackBars();
  }

  static void showErrorSnackBar(BuildContext context, String text) {
    _closeSnackBars(context);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(milliseconds: 1200),
        margin: const EdgeInsets.fromLTRB(20, 0, 20, 25),
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.red,
        elevation: 0,
        padding: const EdgeInsets.fromLTRB(20, 5, 8, 5),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        content: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Text(
                text,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.start,
                style: const TextStyle(fontSize: 15, color: Colors.white),
              ),
            ),
            TextButton(
              onPressed: () => _closeSnackBars(context),
              child: const Text(
                'Dismiss',
                style: TextStyle(
                  fontSize: 17,
                  color: Colors.white,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
