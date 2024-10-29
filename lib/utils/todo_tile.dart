import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ToDoTile extends StatelessWidget {
  final String taskName;
  final bool isCompleted;
  Function(bool?)? onChanged;
  Function()? deleteTask;

  ToDoTile({
    super.key,
    required this.taskName,
    required this.isCompleted,
    required this.onChanged,
    required this.deleteTask,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25, right: 25, top: 25),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: const Color(0xFFF5F7F9),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Checkbox(
              value: isCompleted,
              onChanged: onChanged,
              activeColor: const Color(0xFFC6CFDC),
            ),
            //task name
            // I wrapped the Text widget inside Expanded so the task name stretches and fills available space. This allows the delete button to stay aligned on the right side.
            Expanded(
              child: Text(
                taskName,
                style: TextStyle(
                  color: isCompleted
                      ? const Color(0xFF8D9CB8)
                      : const Color(0XFF3F3D56),
                  // decoration: TextDecoration.lineThrough,
                ),
              ),
            ),
            //delete button
            IconButton(
                onPressed: deleteTask,
                icon: const Icon(
                  Icons.delete,
                  color: Colors.red,
                ))
          ],
        ),
      ),
    );
  }
}
