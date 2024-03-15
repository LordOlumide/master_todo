import 'package:flutter/material.dart';
import 'package:master_todo/utils/widgets/basic_button.dart';

class DeleteDialog extends StatelessWidget {
  final String todoName;

  const DeleteDialog({super.key, required this.todoName});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: const EdgeInsets.symmetric(horizontal: 20),
      shape: RoundedRectangleBorder(
        side: const BorderSide(color: Colors.blue, width: 2),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 30),
            const Align(
              alignment: Alignment.center,
              child: Text(
                'Delete Todo',
                style: TextStyle(fontSize: 29, fontWeight: FontWeight.w600),
              ),
            ),
            const SizedBox(height: 15),
            Text(
              'Are you sure you want to delete "$todoName" todo?',
              style: const TextStyle(fontSize: 19),
            ),
            const SizedBox(height: 30),
            Align(
              alignment: Alignment.center,
              child: BasicButton(
                onPressed: () => _onDeletePressed(context),
                color: Colors.blue,
                height: 60,
                child: const Text(
                  'Delete',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  void _onDeletePressed(BuildContext context) {
    Navigator.of(context).pop(true);
  }
}
