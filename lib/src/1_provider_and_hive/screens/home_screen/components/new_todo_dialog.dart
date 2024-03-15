import 'package:flutter/material.dart';
import 'package:master_todo/src/1_provider_and_hive/models/todo.dart';
import 'package:master_todo/utils/widgets/basic_button.dart';

class NewTodoDialog extends StatefulWidget {
  const NewTodoDialog({super.key});

  @override
  State<NewTodoDialog> createState() => _NewTodoDialogState();
}

class _NewTodoDialogState extends State<NewTodoDialog> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _detailsController = TextEditingController();

  @override
  void dispose() {
    // All controllers most be disposed.
    _titleController.dispose();
    _detailsController.dispose();
    super.dispose();
  }

  String? titleError;
  String? detailsError;

  @override
  Widget build(BuildContext context) {
    final InputDecoration textFieldDecoration = InputDecoration(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: Colors.black, width: 3),
      ),
    );

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
                'Add New Todo',
                style: TextStyle(fontSize: 29, fontWeight: FontWeight.w600),
              ),
            ),
            const SizedBox(height: 16),
            const Text('Todo title', style: TextStyle(fontSize: 14)),
            const SizedBox(height: 3),
            TextField(
              controller: _titleController,
              decoration: textFieldDecoration,
              onChanged: (_) {
                setState(() {
                  titleError = null;
                });
              },
            ),
            titleError == null
                ? const SizedBox.shrink()
                : Text(
                    titleError!,
                    style: const TextStyle(fontSize: 14, color: Colors.red),
                  ),
            const SizedBox(height: 18),
            const Text('Todo details', style: TextStyle(fontSize: 14)),
            const SizedBox(height: 3),
            TextField(
              controller: _detailsController,
              decoration: textFieldDecoration,
              onChanged: (_) {
                setState(() {
                  detailsError = null;
                });
              },
            ),
            detailsError == null
                ? const SizedBox.shrink()
                : Text(
                    detailsError!,
                    style: const TextStyle(fontSize: 14, color: Colors.red),
                  ),
            const SizedBox(height: 35),
            Align(
              alignment: Alignment.center,
              child: BasicButton(
                onPressed: _onCreateNewTodoPressed,
                color: Colors.blue,
                height: 60,
                child: const Text(
                  'Create New Todo',
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

  void _onCreateNewTodoPressed() {
    // You can also use the Form widget and FormFields for validation.
    if (_titleController.text.isEmpty) {
      setState(() {
        titleError = 'Title is required!';
      });
      return;
    } else if (_detailsController.text.isEmpty) {
      setState(() {
        detailsError = 'Details is required!';
      });
      return;
    }

    final Todo newTodo = Todo(
      name: _titleController.text,
      details: _detailsController.text,
      isDone: false,
    );
    Navigator.pop(context, newTodo);
  }
}
