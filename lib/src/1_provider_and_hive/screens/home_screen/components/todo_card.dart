import 'package:flutter/material.dart';
import 'package:master_todo/src/1_provider_and_hive/models/todo.dart';

class TodoCard extends StatelessWidget {
  final Todo todo;
  final Function(bool?) onCheckBoxChanged;
  final VoidCallback onDeletePressed;

  const TodoCard({
    super.key,
    required this.todo,
    required this.onCheckBoxChanged,
    required this.onDeletePressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(15, 4, 0, 4),
      margin: const EdgeInsets.symmetric(horizontal: 3, vertical: 2),
      decoration: BoxDecoration(
          border: Border.all(width: 0.6, color: Colors.blue),
          borderRadius: BorderRadius.circular(6)),
      child: Row(
        children: [
          Column(
            children: [
              Text(
                todo.name,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                todo.details,
                style: const TextStyle(
                  fontSize: 18,
                ),
              ),
            ],
          ),
          const Spacer(),
          Checkbox(
            value: todo.isDone,
            onChanged: onCheckBoxChanged,
          ),
          IconButton(
            onPressed: onDeletePressed,
            icon: const Icon(Icons.delete_outline, color: Colors.red),
          ),
        ],
      ),
    );
  }
}
